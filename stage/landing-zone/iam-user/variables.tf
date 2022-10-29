variable "user_names" {
  description = "Create IAM users with these names"
  type        = list(string)
  default     = ["neo","trinity","morpheus","tank","dozer"]
}

variable "matrix_plot" {
    description = "Matrix leads"
    type        = map(string)
    default     = {
      neo           = "chosen one"
      trinity       = "love interest"
      morpehus      = "mentor"
      dozer         = "background character"
    } 
}
