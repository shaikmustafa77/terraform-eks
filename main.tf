# Create VPC
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "${var.cluster_name}-vpc"
  cidr = var.vpc_cidr

  azs             = ["ap-south-1a", "ap-south-1b"]
  public_subnets  = var.public_subnet_cidrs

  enable_dns_hostnames = true
  enable_dns_support   = true

  # ✅ Enable public IP assignment on public subnets
  map_public_ip_on_launch = true
}

# Create EKS Cluster
module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = var.cluster_name
  cluster_version = "1.29"

  vpc_id                         = module.vpc.vpc_id
  subnet_ids                     = module.vpc.public_subnets
  cluster_endpoint_public_access = true

  enable_irsa = true

  # Create Node Group inside eks module itself
  eks_managed_node_groups = {
    node2 = {
      instance_types = [var.node_instance_type]
      min_size       = var.node_min_size
      max_size       = var.node_max_size
      desired_size   = var.node_desired_size
      capacity_type  = "ON_DEMAND"
      disk_size      = var.node_volume_size

      tags = {
        Name = "eks-node-group"
      }
    }
  }
}
