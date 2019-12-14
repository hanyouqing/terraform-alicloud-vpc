# terraform-alicloud-vpc

terraform-alicloud-vpc

## Pre-depedends

> for [examples/demo](examples/demo)

* Create aliCloud OSS bucket `terraform-alicloud-infra`
* Create AccessKey

## Usage

* `main.tf`

    ```
    module "vpc" {
        source                  = "hanyouqing/vpc/alicloud"

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
    ```

* `variables.tf`

    ```
    variable "region"       { default = "" }    # takes region id as workspace name
    variable "region_abbr"  { default = "" }    # see: https://github.com/hanyouqing/terraform-alicloud-infra/blob/master/variables.tf#L35

    variable "vpc_name"                 { default = "" }
    variable "vpc_description"          { default = "" }
    variable "vpc_cidr_block"           { default = "" } # 10.0.0.0/8, 172.16.0.0/12, 192.168.0.0/16
    variable "vpc_availability_zone"    { default = "" }
    variable "vpc_inner_access_policy"  { default = "" }
    variable "vpc_whitelist_ips"        { default = "" }
    variable "vpc_sg_policy_ssh"        { default = "" }
    variable "vpc_sg_policy_http"       { default = "" }
    variable "vpc_sg_policy_https"      { default = "" }

    variable "tags" {
        default = {
            environment = ""    # develop|testing|staging|production
            department  = ""
            project     = ""
            service     = ""
            createby    = ""
            owner       = ""
            provisioner = ""
        }
    }
    ```

* `output.tf`

    ```
    output "motd" {
        value = var.motd
    }
    output "name" {
        value = alicloud_vpc.icmdb.name
    }
    output "sg" {
        value = alicloud_security_group.icmdb.name
    }
    output "whitelist" {
        value = var.vpc_whitelist_ips
    }
    ```

* `terraform.tfvars`

    ```
    region       = "cn-beijing"
    region_abbr  = "bj"

    tags = {
        environment = "testing"     # develop|testing|staging|production
        department  = "infrastructure"
        createby    = "ihanyouqing@gmail.com"
        project     = "icmdb"
        service     = "web"
        owner       = "icmdb"
        provisioner = "terraform"
    }

    # variables for vpc
    vpc_name                = "icmdb"
    vpc_description         = "icmdb"
    vpc_availability_zone   = "cn-beijing-e"
    vpc_inner_access_policy = "Drop"            # Accept|Drop, allow from all in the same security group
    vpc_whitelist_ips       = "106.38.171.130"
    vpc_sg_policy_ssh       = "accept"          # accept|drop
    vpc_sg_policy_http      = "accept"
    vpc_sg_policy_https     = "drop"
    ```


## Quick Start with Demo Example

```
git clone https://github.com/hanyouqing/terraform-alicloud-vpc.git

cd terraform-alicloud-vpc/examples/demo

terraform init

terraform plan

terraform apply
```
