/**
  Overview: 
   * Create VPC Network
   * Create Internet Gateway
   * Create Route Tables
   * Create Subnets
     * Attach Route Tables to Subnets
   * Create corresponding NAT Gateways for each Private Subnet
     * Create EIP for NAT Gateways
     * Attach EIP to NAT Gateways
   
   * Create Firewall on Resource Level - Security Groups
   * Create Network Interface  
     * Create EIP for Network Interface
     * Attach EIP to Network Interface
  
  TODO: 
   * Study CIDR
   * Make each of the public/private subnet be located in a different az
*/

# Create VPC Network
resource "aws_vpc" "vpc" {
    cidr_block = var.cidr_block["vpc"]
    instance_tenancy = "default"  

    # required for eks, that's all you need to know 
    enable_dns_support = true
    enable_dns_hostnames = true

    # defaults, that's all you need to know 
    enable_classiclink = false
    enable_classiclink_dns_support = false
}

# Create Internet Gateway
resource "aws_internet_gateway" "internet_gateway" {
    vpc_id = aws_vpc.vpc.id
}

# Create Route Tables
resource "aws_route_table" "public" {
    vpc_id = aws_vpc.vpc.id

    route {
        cidr_block = var.cidr_block["route_table_public"] 
        gateway_id = aws_internet_gateway.internet_gateway.id
    }
}

resource "aws_route_table" "private" {
    count = var.resource_counts["route_table_private"]
    vpc_id = aws_vpc.vpc.id

    route {
        cidr_block = var.rt_cidr_block["route_table_private_${count.index}"]
        nat_gateway_id = aws_nat_gateway.gw2.id
    }
}

# Create Subnets
resource "aws_subnet" "public" {
    count = var.resource_counts["subnet_public"]
    vpc_id = aws_vpc.prod-vpc.id 
    cidr_block = var.cidr_block["subnet_public_${count.index}"]
    availability_zone = var.availability_zone[0] // TODO 

    # required for eks - instances launched into the subnet should be assigned a public ip address 
    map_public_ip_on_launch = true 
}

resource "aws_subnet" "private" {
    count = var.resource_counts["subnet_private"]
    vpc_id = aws_vpc.prod-vpc.id 
    cidr_block = var.cidr_block["subnet_private_${count.index}"]
    availability_zone = var.availability_zone[0] // TODO 

    # required for eks - instances launched into the subnet should be assigned a public ip address 
    map_public_ip_on_launch = true 
}

# Attach Route Tables to Subnets
resource "aws_route_table_association" "public" {
    count = var.resource_counts["subnet_public"]
    subnet_id = aws_subnet.public[count.index].id
    route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private" {
    count = var.resource_counts["subnet_private"]
    subnet_id = aws_subnet.private[count.index].id
    route_table_id = aws_route_table.private[count.index].id
}

# 
resource "aws_eip" "eip-nat-gw" {
    count = var.resource_counts["nat_gateway"]
    vpc = true 
    network_interface = aws_network_interface.web-server-nic.id 
    associate_with_private_ip = "10.0.1.50" // TODO - idk what this is 
    depends_on = [aws_internet_gateway.gw]
}

# Create corresponding NAT Gateways for each Private Subnet
resource "aws_nat_gateway" "gw" {
    count = var.resource_counts["nat_gateway"]
    allocation_id = aws_eip.eip-nat-gw[count.index].id
    subnet_id = aws_subnet.public[count.index].id
}

# Create Firewall on Resource Level - Security Groups
resource "aws_security_group" "allow_web" {
    name        = "allow_web"
    description = "Allow web inbound traffic"
    vpc_id      = aws_vpc.prod-vpc.id 

    ingress {
        description      = "HTTP"
        from_port        = 443
        to_port          = 443
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"] # 0.0.0.0/0 means any ip address can enter port specified in this ingress 
    }

    ingress {
        description      = "HTTP"
        from_port        = 80
        to_port          = 80
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"] # 0.0.0.0/0 means any ip address can enter port specified in this ingress 
    }

    ingress {
        description      = "SSH"
        from_port        = 2
        to_port          = 2
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"] # 0.0.0.0/0 means any ip address can enter port specified in this ingress 
    }

    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    tags = {
        Name = "allow_web"
    }
}

# Create Network Interface
resource "aws_network_interface" "web-server-nic" {
    subnet_id       = aws_subnet.public[0].id
    private_ips     = ["10.0.0.50"]
    security_groups = [aws_security_group.web.id]
}

# Create EIP for Network Interface
resource "aws_eip" "eip-network-interface" {
    vpc = true 
    network_interface = aws_network_interface.web-server-nic.id 
    associate_with_private_ip = "10.0.1.50"
    depends_on = [aws_internet_gateway.gw]
}