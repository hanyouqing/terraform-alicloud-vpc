output "motd" {
    value = "${module.terraform-alicloud-vpc.motd}"
}
output "vpc" {
    value = {
        "vpc_name": "${module.terraform-alicloud-vpc.name}",
        "vpc_sg": "${module.terraform-alicloud-vpc.sg}",
        "vpc_whitelist": "${module.terraform-alicloud-vpc.whitelist}",
    }
}
