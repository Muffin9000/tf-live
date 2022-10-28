provider "aws" {
    region = "us-east-1"
}

terraform {
  backend "s3" {
    key            = "prod/services/web-cluster/terraform.tfstate"
  }
}

module "webserver_cluster" {
  source = "../../../modules/services/webserver-cluster"

  cluster_name            = "webserver-prod"
  db_remote_state_bucket  = "terraform-up-and-running-state-thedragoon"
  db_remote_state_key     = "prod/data-stores/mysql/terraform.tfstate"
  port                    = 8080

  instance_type           = "t2.micro"
  max_size                = 3
  min_size                = 2  
}
