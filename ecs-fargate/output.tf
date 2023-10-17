output "load_balancer_ip" {
  value = aws_lb.default.dns_name
}
output "vpc_id" {
  value = data.terraform_remote_state.vpc.outputs.vpc_id
}

output "subnet01_id" {
  value = data.terraform_remote_state.vpc.outputs.subnet01_id
}

output "subnet02_id" {
  value = data.terraform_remote_state.vpc.outputs.subnet02_id
}

output "subnet03_id" {
  value = data.terraform_remote_state.vpc.outputs.subnet03_id
}

output "subnet04_id" {
  value = data.terraform_remote_state.vpc.outputs.subnet04_id
}
