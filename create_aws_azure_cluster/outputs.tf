output "cluster_connection_string" {
  value = mongodbatlas_advanced_cluster.testMultiCloudCluster.connection_strings[0].standard
}
