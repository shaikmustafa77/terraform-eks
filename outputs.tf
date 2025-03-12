output "cluster_endpoint" {
  description = "EKS Cluster Endpoint"
  value       = module.eks.cluster_endpoint
}

output "cluster_certificate_authority_data" {
  description = "EKS Cluster CA Data"
  value       = module.eks.cluster_certificate_authority_data
}

output "cluster_name" {
  description = "EKS Cluster Name"
  value       = module.eks.cluster_name
}
