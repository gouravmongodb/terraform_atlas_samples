resource "mongodbatlas_cluster" "example_cluster" {
  project_id    = var.project_id
  name          = var.cluster_name

  cluster_type = "REPLICASET"
  backup_enabled = false

  replication_specs {
    num_shards = 1
    regions_config {
      region_name     = "CA_WEST_1"
      electable_nodes = 3
      priority        = 7
      read_only_nodes = 0
    }
  }
  auto_scaling_disk_gb_enabled = false
  mongo_db_major_version       = "6.0"

  # Provider Settings "block"
  provider_name = "AWS"
  provider_instance_size_name = "M30"
}
