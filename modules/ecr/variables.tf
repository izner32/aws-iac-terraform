variable "environment" {
    type = string 
    description = "Repository name"
}   

variable "image_tag_mutability" {
  type = bool
  description = "Whether to allow image tags to be overwritten"
  default = true
}

variable "scan_on_push" {
  type = bool
  description = "Whether to scan images on push"
  default = true
}

