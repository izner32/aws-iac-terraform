# Repository Structure
```
    account - cloud resource created only once not dependent on environment type, e.g. iam accounts
        │
        │―――― iam
        │       │
        │       │―――― credentials-windows.sh [DO NOT PUSH TO REPO] - for setting up env variable to insert values in credentials.tf
        │       │―――― credentials.tf - variables file for credentials used in provider.tf
        │       │―――― main.tf - creation of resource from module 
        │       │―――― output.tf - print specified values after creation of resource
        │       │―――― provider.tf - specify cloud provider 
        │       │―――― version.tf - specify requirement version of terraform and provider
        │
        │―――― etc.
    
    environment
        │
        │―――― dev
        │       │
        │       │―――― {cloud-resource}, e.g. eks
        │       │       │
        │       │       │―――― credentials-windows.sh [DO NOT PUSH TO REPO] - for setting up env variable to insert values in credentials.tf
        │       │       │―――― credentials.tf - variables file for credentials used in provider.tf
        │       │       │―――― main.tf - creation of resource from module | always include an overview comment at the top in the file
        │       │       │―――― output.tf - print specified values after creation of resource
        │       │       │―――― provider.tf - specify cloud provider 
        │       │       │―――― version.tf - specify requirement version of terraform and provider
        │       │
        │       │――― etc.     
        │
        │―――― prod 
        │
        │―――― etc.

    modules - cloud resources, e.g. aws eks, aws ecr, etc.
        │
        │―――― {cloud-resource} - e.g. eks 
        │       │
        │       │―――― diagrams
        │       │       │
        │       │       │―――― {diagram_name}.xml - draw.io file 
        │       │       │―――― {diagram_name}.png
        │       │         
        │       │―――― README.md - containing the overview diagram of the module 
        │       │―――― main.tf - creation of aws resource
        │       │―――― output.tf - print specified values after creation of resource 
        │       │―――― variables.tf - configuration file used in main.tf
        │
        │―――― etc.
```

# Naming Convention