resource "aws_db_instance" "example" {
  identifier_prefix     = "terraform-up-and-running"
  engine                = "mysql"
  allocated_storage     = 10
  instance_class        = var.instance_class
  skip_final_snapshot   = true
  db_name               = var.cluster_name

  username = var.db_username
  password = var.db_password

}

