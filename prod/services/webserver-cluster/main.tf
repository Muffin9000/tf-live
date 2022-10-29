provider "aws" {
    region = "us-east-1"
}

terraform {
  backend "s3" {
    key            = "prod/services/web-cluster/terraform.tfstate"
  }
}

module "webserver_cluster" {
  source = "../../../../modules/services/webserver-cluster"
  #source = "github.com/Muffin9000/tf-modules//services/webserver-cluster/?ref=v0.0.1"

  cluster_name            = "webserver-prod"
  db_remote_state_bucket  = "terraform-up-and-running-state-thedragoon"
  db_remote_state_key     = "prod/data-stores/mysql/terraform.tfstate"
  port                    = 8080
  server_text             = "Prod"
  ami                     = "ami-08c40ec9ead489470"

  instance_type           = "t2.micro"
  max_size                = 3
  min_size                = 2  

  enable_autoscaling      = true

  custom_tags             = {
    Owner     = "Muffin9K"
    Env       = "prod"
    ManagedBy = "terraform"
  }
}