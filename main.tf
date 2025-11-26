provider "aws" {
  region = var.aws_region
}

variable vpc_id {
  type = string
  description = "default vpc for sg build testing"
}

variable aws_region {
  type = string
  description = "region for aws"
  default = "us-west-2"
}

locals {
  security_groups = {
    "test-sg-1" = "test-sg-1"
    "test-sg-2" = "test-sg-2"
  }
}

# resource "aws_security_group" "sgs" {
#   for_each = local.security_groups

#   name        = each.value
#   description = "Managed by Terraform"
#   vpc_id      = var.vpc_id

#   tags = {
#     Name = each.value
#   }
# }

# output "security_group_ids" {
#   value = {
#     for name, sg in aws_security_group.sgs :
#     name => sg.id
#   }
#   description = "Map of all security group names to their IDs"
# }