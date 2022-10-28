output "mysql_address" {
    value = module.mysql.myql_address
    description = "database endpoint"
}

output "mysql_port" {
  value = module.mysql.myql_port
  description = "database port"
}