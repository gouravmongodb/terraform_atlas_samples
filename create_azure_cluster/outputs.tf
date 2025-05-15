output "cluster_connection_string" {
  value = mongodbatlas_cluster.testAzureCluster.connection_strings[0].standard
}
