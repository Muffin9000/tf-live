provider "aws" {
    region = "us-east-1"

    default_tags {
      tags = {
        Owner = "team-foo"
        ENV   = "Staging"
      }
    }
}

terraform {
  backend "s3" {
    key            = "stage/services/web-cluster/terraform.tfstate"
  }
}

module "webserver_cluster" {
  source = "../../../../modules/services/webserver-cluster"
  #source = "github.com/Muffin9000/tf-modules//services/webserver-cluster/?ref=v0.0.1"

  cluster_name            = "webserver-stage"
  db_remote_state_bucket  = "terraform-up-and-running-state-thedragoon"
  db_remote_state_key     = "stage/data-stores/mysql/terraform.tfstate"
  port                    = 8080
  server_text             = "Stage" 
  ami                     = "ami-08c40ec9ead489470"

  instance_type           = "t2.micro"
  max_size                = 3
  min_size                = 2  

  enable_autoscaling      = false 

  custom_tags             = {
    Owner     = "Muffin9K"
    Env       = "stage"
    ManagedBy = "terraform"
  }
}

resource "aws_security_group_rule" "allow_testing_port_inbound" {
  type                = "ingress"
  security_group_id   = module.webserver_cluster.alb_security_group_id

  from_port =  3000
  to_port =  3000
  protocol = "-1"
  cidr_blocks = ["0.0.0.0/0"]
}
