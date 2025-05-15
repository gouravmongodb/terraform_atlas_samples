resource "mongodbatlas_cluster" "existing_cluster" {
  project_id    = var.project_id
  name          = var.cluster_name
  provider_name = "AWS"
  provider_instance_size_name = "R40"
  cluster_type = "REPLICASET"
  backup_enabled = false
  provider_region_name = "CA_WEST_1"
  provider_auto_scaling_compute_min_instance_size = "R40"
  provider_auto_scaling_compute_max_instance_size = "R50"
}
