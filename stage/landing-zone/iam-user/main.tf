provider "aws" {
  region = "us-east-1"
}

module "users" {
    source = "../../../../modules/landing-zone/iam-user"

#   EXTRACT FROM LIST USING COUNT
#   count = length(var.user_names)
#   user_name = var.user_names[count.index]

#   EXTRACT FROM COLLECTION
    for_each                        = toset(var.user_names)
    user_name                       = each.value
    give_neo_cloudwatch_full_access = true
}