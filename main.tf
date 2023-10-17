
provider "aws" {
  region = "ap-south-1"
}

# module "vpc" {
#   source = "./vpc"
#   region = "ap-south-1"

#   # vpc:
#   vpc_cidr_block       = "10.0.0.0/16"
#   vpc_instance_tenancy = "default"
#   vpc_name             = "tf-vpc-hitika"

#   #avilaibility_zones:
#   availability_zone_1 = "ap-south-1a"
#   availability_zone_2 = "ap-south-1b"
 
#   # pub_subnets:
#   pub_subnet1_cidr    = "10.0.1.0/24"
#   pub_subnet1_name    = "tf-pub1-subnet-hitika"
#   pub_subnet2_cidr    = "10.0.3.0/24"
#   pub_subnet2_name    = "tf-pub2-subnet-hitika"

#   # priv_subnets
#   priv_subnet1_cidr   = "10.0.2.0/24"
#   priv_subnet1_name   = "tf-pri1-subnet-hitika"
#   priv_subnet2_cidr   = "10.0.4.0/24"
#   priv_subnet2_name   = "tf-pri2-subnet-hitika"

#   # pub_route_table:
#   pub_route_table_name = "tf-pubroute-hitika"


#   # priv_route_table:
#   priv_route_table_name = "tf-priroute-hitika"


#   # # public instance:
#   # pub_instance_ami      = "ami-03f65b8614a860c29"
#   # pub_instance_type     = "t2.micro"
#   # pub_instance_key_name = "my-ec2"
#   # pub_instance_name     = "Terra-pub-ec2"


#   # private instance:
#   priv_instance_ami      = "ami-03f65b8614a860c29"
#   priv_instance_type     = "t3.medium"
#   priv_instance_key_name = "prod"
#   priv_instance_name     = "tf-Jenkins-hitika"

# }

module "my_cloudfront_s3" {
  source = "./cdn-s3"

  region                            = "ap-south-1"
  cf_origin_access_identity_comment = "MyCustomComment"
  s3_bucket_name                    = "tf-s3-hitika"
  cf_distribution_comment           = "CustomCloudFrontDistribution"
  cf_restriction_locations = ["US", "CA", "GB", "DE", "IN"]
}


# module "my_ecr" {
#   source = "./ecr"

#   region = "ap-south-1"
#   ecr    = "hadiya-backend-hitika"
# }

data "terraform_remote_state" "vpc" {
  backend = "local"
  config = {
      path = "/home/neosoft/terraform-project/tf/vpc/terraform.tfstate"
    }
  }

module "ecs" {
  source      = "./ecs-fargate"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_id
  public_subnets = [data.terraform_remote_state.vpc.outputs.subnet01_id, data.terraform_remote_state.vpc.outputs.subnet02_id]
  private_subnets = [data.terraform_remote_state.vpc.outputs.subnet03_id, data.terraform_remote_state.vpc.outputs.subnet04_id]
  app_count   = 1
}

# module "rds" {
#   source = "./rds"
#   region                   = "ap-south-1"
#   db_instance_identifier   = "tf-db-hitika"
#   rds_storage_type         = "gp2"
#   allocated_storage        = 20
#   db_username              = "admin"
#   db_password              = "password"
#   rds_publicly_accessible  = false
#   security_group_name      = "rds-sg"
#   security_group_cidr      = "0.0.0.0/0"
#   rds_engine               = "mysql"
#   rds_engine_version       = "8.0.28"
#   rds_instance_class       = "db.t3.micro"
#   rds_parameter_group_name = "default.mysql8.0"
#   rds_skip_final_snapshot  = true
#   rds_option_group_name = "default:mysql-8-0"
# }