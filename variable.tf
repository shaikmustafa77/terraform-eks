variable "cluster_name" {
  default = "EKS-YELP"
}

variable "region" {
  default = "ap-south-1"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "node_group_name" {
  default = "node2"
}

variable "node_instance_type" {
  default = "t3.medium"
}

variable "node_desired_size" {
  default = 3
}
variable "node_min_size" {
  default = 2
}

variable "node_max_size" {
  default = 4
}

variable "node_volume_size" {
  default = 20
}

variable "ssh_key_name" {
  default = "DevOps"
}
