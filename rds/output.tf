output "db_instance_endpoint" {
  value       = aws_db_instance.myinstance.endpoint
}

output "vpc_id" {
  value = data.terraform_remote_state.vpc.outputs.vpc_id
}

output "subnet03_id" {
  value = data.terraform_remote_state.vpc.outputs.subnet03_id
}

output "subnet04_id" {
  value = data.terraform_remote_state.vpc.outputs.subnet04_id
}