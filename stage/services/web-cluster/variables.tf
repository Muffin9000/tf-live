variable "port" {
    description = "set igress from and to port for the security policy"
    type = number
    default = 8080
}

variable "db_remote_state_bucket" {
    description = "remote bucket s3"
    type = string
    default = "terraform-up-and-running-state-thedragoon"
}

variable "db_remote_state_key" {
    description = "in which path to keep state"
    type = string
    default = "stage/services/web-cluster/terraform.tfstate"
}