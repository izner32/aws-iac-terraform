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

# Naming Convention 
## Resource 
* group - {group_name} 
* user - {user_name} 
* user-access-key - {group_name}_{user_name}_access_key
* policy - {policy_name}
* attach-user-to-group - {group_name}_attach_users
* attach-policy-to-user - {group_name}_{user_name}_attach_policy
* attach-policy-to-group - {group_name}_attach_policy

## Output
* user-access-key - {group_name}_{user_name}_access_key
* user-secret-key - {group_name}_{user_name}_secret_key
