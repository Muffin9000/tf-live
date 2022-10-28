provider "aws" {
 region = "us-east-1" 
}

terraform {
  backend "s3" {
    key            = "stage/data-stores/mysql/terraform.tfstate"
  }
}

module "mysql" {
  #source = "../../../../modules/data-stores/mysql"
  source = "github.com/Muffin9000/tf-modules//data-stores/mysql/?ref=v0.0.1"

  cluster_name    = "stage"
  db_username     = "mysqluser"
  db_password     = "mysqlSom3th!ngelse"
  instance_class  = "db.t2.micro"
}

