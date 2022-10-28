resource "aws_db_instance" "example" {
  identifier_prefix     = "terraform-up-and-running"
  engine                = "mysql"
  allocated_storage     = 10
  instance_class        = "db.t2.micro"
  skip_final_snapshot   = true
  db_name               = "${cluster_name}_database"

  username = var.db_username
  password = var.db_password
  
}

