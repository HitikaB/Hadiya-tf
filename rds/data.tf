
data "terraform_remote_state" "vpc" {
  backend = "local"
  config = {
      path = "/home/neosoft/terraform-project/tf/vpc/terraform.tfstate"
    }
  }