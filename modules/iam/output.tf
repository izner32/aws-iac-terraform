/**
   Overview: 
    * Print Access and Secret Keys from Created Users
   
   TODO:
    * Fix the output of the Access and Secret Keys
*/

# output "access_keys" {
#   value = aws_iam_access_key.users[*].id
# }

# output "secret_keys" {
#   value = aws_iam_access_key.users[*].secret
# }