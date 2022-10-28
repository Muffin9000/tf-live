provider "aws" {
 region = "us-east-1" 
}

terraform {
  backend "s3" {
    key            = "prod/data-stores/mysql/terraform.tfstate"
  }
}

module "mysql" {
  #source = "../../../../modules/data-stores/mysql"
  source = "github.com/Muffin9000/tf-modules//data-stores/mysql/?ref=v0.0.1"

  cluster_name    = "prod"
  db_username     = "mysqluserprod"
  db_password     = "mysqlSom3th!ngelsePROD"
}

