/**
   * @dev Print Access and Secret Keys from Created Users
*/
output "admin_ecr_access_key" {
  value = aws_iam_access_key..id
}

output "admin_ecr_secret_key" {
  value     = aws_iam_access_key.brand_new_user.encrypted_secret
  sensitive = true
}

output "admin_eks_access_key" {
  value = aws_iam_access_key.brand_new_user.id
}

output "admin_eks_secret_key" {
  value     = aws_iam_access_key.brand_new_user.encrypted_secret
  sensitive = true
}

output "job_function_cicd_user_1_access_key" {
  value = aws_iam_access_key.brand_new_user.id
}

output "job_function_cicd_user_1_secret_key" {
  value     = aws_iam_access_key.brand_new_user.encrypted_secret
  sensitive = true
}