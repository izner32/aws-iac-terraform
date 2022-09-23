# Repository Structure
```
    account - account-wide cloud resource, e.g. aws iam
    environment
        │
        │―――― dev
        │       │
        │       │―――― {cloud-resource} - e.g. eks
        │       │       │
        │       │       │―――― credentials-windows.sh [DO NOT PUSH TO REPO] - for setting up env variable to be used as credential in provider.tf
        │       │       │―――― main.tf - creation of resource from module 
        │       │       │―――― output.tf - print specified values after creation of resource
        │       │       │―――― provider.tf - cloud provider 
        │       │       │―――― variables.tf - configuration file used in main.tf
        │       │       │―――― version.tf - specify requirement version of terraform and provider
        │       │
        │       │――― etc.     
        │
        │―――― prod 
        │―――― etc.
        │
    modules - {cloud-resources} - e.g. aws 
        │
        │―――― {cloud-resource} - e.g. eks 
        │       │
        │       │―――― main.tf - creation of aws resource
        │       │―――― network.tf [optional] - creation of network
        │       │―――― output.tf - print specified values after creation of resource 
        │       │―――― variables.tf - configuration file used in main.tf
        │
        │―――― etc.
```

# Naming Convention