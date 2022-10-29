variable "user_names" {
  description       = "Create IAM users with below names"
  type              = list(string)
  default           = ["neo","trinity","morpheus","tank","dozer"]    
}