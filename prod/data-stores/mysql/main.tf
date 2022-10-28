provider "aws" {
 region = "us-east-1" 
}

terraform {
  backend "s3" {
    key            = "prod/data-stores/mysql/terraform.tfstate"
  }
}

module "mysql" {
  source = "../../../modules/data-stores/mysql"

  cluster_name    = "prod"
  db_username     = var.db_username
  db_password     = var.db_password
}

