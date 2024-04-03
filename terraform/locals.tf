locals {
  name = "${var.project_name}-${var.environment}"
  current_time = formatdate("YYYY-MM-DD-hh-mm", timestamp())
  #database_subnets_id = element(split(",", data.aws_ssm_parameter.database_subnets_ids.value),0)
  #private_subnet_id = element(split(",", data.aws_ssm_parameter.private_subnet_ids.value), 0)
  #public_subnet_id = element(split(",", data.aws_ssm_parameter.public_subnet_ids.value), 0)
}






