# @reference:
#   https://www.terraform.io/docs/configuration/outputs.html
#
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