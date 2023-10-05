variable vpc_cidr {
  default = "192.168.0.0/16"
}

variable pub_sbn_a {
  default = "192.168.1.0/24"
}

variable pub_sbn_b {
  default = "192.168.2.0/24"
}

variable prefix {
  default = "Terraform-PoC"
}

variable ec2_key{
  default = "Terraform-PoV"
}