provider "aws" {
    region = "us-east-1"
}

terraform {
  backend "s3" {
    key            = "prod/services/web-cluster/terraform.tfstate"
  }
}

module "webserver_cluster" {
  #source = "../../../../modules/services/webserver-cluster"
  source = "github.com/Muffin9000/tf-modules//services/webserver-cluster/?ref=v0.0.1"

  cluster_name            = "webserver-prod"
  db_remote_state_bucket  = "terraform-up-and-running-state-thedragoon"
  db_remote_state_key     = "prod/data-stores/mysql/terraform.tfstate"
  port                    = 8080

  instance_type           = "t2.micro"
  max_size                = 3
  min_size                = 2  
}

resource "aws_autoscaling_schedule" "scale_out_during_business_hours" {
  scheduled_action_name = "scale-out-during-business-hours"
  min_size              = 2
  max_size              = 10
  desired_capacity      = 10
  recurrence            = "0 9 * * *"

  autoscaling_group_name = module.webserver_cluster.asg_name
}

resource "aws_autoscaling_schedule" "scale_in_at_night" {
  scheduled_action_name = "scale-in-at-night"
  min_size              = 2
  max_size              = 10
  desired_capacity      = 2
  recurrence            = "0 17 * * *"

  autoscaling_group_name = module.webserver_cluster.asg_name
}