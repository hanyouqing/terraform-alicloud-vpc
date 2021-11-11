variable "profile"      { default = "default" }
variable "region"       { default = "cn-beijing" }
variable "region_abbr"  { default = "bj" }

variable "vpc_name"                 { default = "icmdb" }
variable "vpc_description"          { default = "icmdb" }
variable "vpc_cidr_block"           { default = "172.16.0.0/16" } # 10.0.0.0/8, 172.16.0.0/12, 192.168.0.0/16
variable "vpc_availability_zone"    { default = "cn-beijing-e" }
variable "vpc_inner_access_policy"  { default = "Drop" }
variable "vpc_whitelist_ips"        { default = "106.38.171.130" }
variable "vpc_sg_policy_ssh"        { default = "accept" }
variable "vpc_sg_policy_http"       { default = "accept" }
variable "vpc_sg_policy_https"      { default = "drop" }

variable "tags" {
    default = {
        environment = "testing"    # develop|testing|staging|production
        department  = "infrastructure"
        project     = "ihanyouqing@gmail.com"
        service     = "icmdb"
        createby    = "iwebhook"
        owner       = "icmdb"
        provisioner = "terraform"
    }
}

variable "cidr_blocks" {
    description = "10.0.0.0/8, 172.16.0.0/12, 192.168.0.0/16"
    default = {
        qd    = "192.168.1.0/24"  # cn-qingdao       northchina-1
        bj    = "192.168.2.0/24"  # cn-beijing       northchina-2
        zjk   = "192.168.3.0/24"  # cn-zhangjiakou   northchina-3
        hhht  = "192.168.4.0/24"  # cn-huhehaote     northchina-4
        hz    = "192.168.5.0/24"  # cn-hangzhou      eastchina-1
        sh    = "192.168.6.0/24"  # cn-shanghai      eastchina-2
        cd    = "192.168.7.0/24"  # cn-chengdu       southwest-1
        hk    = "192.168.8.0/24"  # cn-hkongkong     HongKong

        tyo   = "192.168.9.0/24"  # ap-northeast-1   Tokyo - Japana
        sg    = "192.168.9.0/24"  # ap-southeast-2   Singapore
        kl    = "192.168.9.0/24"  # ap-southeast-3   Kuala Lumpur - Malaysia
        jk    = "192.168.9.0/24"  # ap-southeast-5   Jakarta - Indonesia
        bom   = "192.168.9.0/24"  # ap-south-1       Bombay - India

        usva  = "192.168.9.0/24"  # us-east-1        Virginia - US
        ussv  = "192.168.9.0/24"  # us-east-1        Silicon Valley - US

        ldn   = "192.168.9.0/24"  # eu-west-1        London - UK
        ffm   = "192.168.9.0/24"  # eu-central-1     Frankfurt - France

        dxb   = "192.168.9.0/24"  # me-east-1        Dubai - UThe United Arab EmiratesK
    }
}