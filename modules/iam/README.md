# Overview 
## Architecture 
-> create identities(groups,users,etc.) with programmatic access <br />
-> send the identities' keys(access and secret keys) output to aws kms <br />
-> use the created user's credential for creating resource (e.g. EKS-Admin[user] is responsible for creating eks clusters in dev/prod environment) <br />

## Account Accessibility Design
* [GROUP] Admin 
    * [USER] ECR-Admin -> full access to ecr 
    * [USER] EKS-Admin -> full access to eks
* [GROUP] CICD (Job Function)
    * [USER] Renz -> least-privilege-access to cicd resources he/she needs
