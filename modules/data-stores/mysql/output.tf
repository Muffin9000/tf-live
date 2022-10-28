output "myql_address" {
    value = aws_db_instance.example.address
    description = "database endpoint"
}

output "myql_port" {
  value = aws_db_instance.example.port
  description = "database port"
}