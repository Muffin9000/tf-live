variable "cluster_name" {
  description       = "Environment name for cluster resources"
  type              = string
}

variable "db_username" {
    description     = "mysql database username"
    type            = string
    sensitive       = true
}

variable "db_password" {
    description     = "mysql database password"
    type            = string
    sensitive       = true
}