# @reference:
#   https://www.terraform.io/docs/backends/config.html      
#   https://www.terraform.io/docs/backends/types/remote.html
#   https://www.terraform.io/docs/backends/types/oss.html
#   https://www.terraform.io/docs/providers/alicloud/r/vpc.html
#   https://www.terraform.io/docs/commands/cli-config.html

# credentials "app.terraform.io" {
#     token = "${var.tf_credentials}"
# }
terraform {
    required_version = ">= 0.12.18"
}
provider "alicloud" {
    version = ">= 1.64"
}
module "vpc" {
    # source                  = "hanyouqing/vpc/alicloud"
    source                  = "../../../vpc"
    vpc_name                = var.vpc_name
    vpc_description         = var.vpc_description
    vpc_cidr_block          = lookup(var.cidr_blocks, var.region_abbr)
    vpc_availability_zone   = var.vpc_availability_zone
    vpc_inner_access_policy = var.vpc_inner_access_policy
    vpc_whitelist_ips       = var.vpc_whitelist_ips
    vpc_sg_policy_ssh       = var.vpc_sg_policy_ssh
    vpc_sg_policy_http      = var.vpc_sg_policy_http
    vpc_sg_policy_https     = var.vpc_sg_policy_https

    tags = var.tags
}
