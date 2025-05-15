
resource "mongodbatlas_cluster" "testAzureCluster" {
  project_id   = var.project_id
  name         = var.cluster_name
  cluster_type = "REPLICASET"
  replication_specs {
    num_shards = 1
    regions_config {
      region_name     = "US_EAST"
      electable_nodes = 3
      priority        = 7
      read_only_nodes = 0
    }
  }
  cloud_backup     = false
  auto_scaling_disk_gb_enabled = true
  mongo_db_major_version       = "7.0"

  # Provider Settings "block"
  provider_name               = "AZURE"
  provider_disk_type_name     = "P6"
  provider_instance_size_name = "M30"
}
