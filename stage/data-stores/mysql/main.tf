provider "aws" {
 region = "us-east-1" 
}

terraform {
  backend "s3" {
    key            = "stage/data-stores/mysql/terraform.tfstate"
  }
}

module "mysql" {
  source = "../../../modules/data-stores/mysql"

  cluster_name    = "stage"
  db_username     = var.db_username
  db_password     = var.db_password
}

