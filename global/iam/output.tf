# output "first_arn" {
# EXTRACT FROM LIST

#   value         = aws_iam_user.example[0].arn
#   description   = "Arn of the first user"  
# }

# output "all_arns" {
#   value         = aws_iam_user.example[*].arn
#   description = "Arn of all users"
# }

# EXTRACT FROM COLLECTION

output "all_users" {
    value = aws_iam_user.example
  
}

# GET LIST OF VALUES FROM COLLECTION 
output "all_arns" {
  value = values(aws_iam_user.example)[*].arn
}

