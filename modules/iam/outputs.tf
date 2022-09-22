/**
   * @dev Print Access and Secret Keys from Created Users
*/

// TODO fix output

# output "access_keys" {
#   value = aws_iam_access_key.users[*].id
# }

# output "secret_keys" {
#   value = aws_iam_access_key.users[*].secret
# }