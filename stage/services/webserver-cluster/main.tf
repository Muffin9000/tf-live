provider "aws" {
    region = "us-east-1"
}

terraform {
  backend "s3" {
    key            = "stage/services/web-cluster/terraform.tfstate"
  }
}

module "webserver_cluster" {
  #source = "../../../../modules/services/webserver-cluster"
  source = "github.com/Muffin9000/tf-modules//services/webserver-cluster/?ref=v0.0.1"

  cluster_name            = "webserver-stage"
  db_remote_state_bucket  = "terraform-up-and-running-state-thedragoon"
  db_remote_state_key     = "stage/data-stores/mysql/terraform.tfstate"
  port                    = 8080

  instance_type           = "t2.micro"
  max_size                = 3
  min_size                = 2  

}

resource "aws_security_group_rule" "allow_testing_port_inbound" {
  type                = "ingress"
  security_group_id   = module.webserver_cluster.alb_security_group_id

  from_port =  3000
  to_port =  3000
  protocol = "-1"
  cidr_blocks = ["0.0.0.0/0"]
}
