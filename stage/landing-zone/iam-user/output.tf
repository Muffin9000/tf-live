# FROM LIST
# output "user_arns" {
#   value           = module.users[*].user_arn
#   description     = "ARNs of created IAM users"
# }

# FROM COLLECTION
# output "user_arns" {
#     value           = values(module.users)[*].user_arn
#     description     = "ARNs of created IAM users"
# }


output "upper_names" {
    value           = [for name in var.user_names : upper(name) if substr(name,0,1) == "t" || length(name) < 5 ] 
}


# TO OUTPUT IN MAP FORMAT USE {}
output "names_by_index" {
    value           = { for index,value in var.user_names : index => value }
}

# TO OUTPUT IN LIST FORMAT []
output "matrix_plot" {
    value           = [for key,value in var.matrix_plot : "${key} is the ${value}"] 
}

# OUTPUT IN FOR-DIRECTIVE
output "for_directive" {
    value           = <<EOF
    %{~ for i,name in var.user_names ~}
    ${name}%{if i < length(var.user_names) - 1 }, %{else}.%{endif}
    %{~ endfor ~}
    EOF
}

output "for_directive_w_index" {
    value           = "%{ for i,name in var.user_names }<${i}> -> ${name}, %{ endfor }" 
  
}

output "neo_cloudwatch_policy_arn" {
  value             = values(module.users)[0].neo_cloudwatch_policy_arn
}
