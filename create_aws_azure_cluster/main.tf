
# This resource "mongodbatlas_advanced_cluster" is a new resource and will need latest resource version
# https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/advanced_cluster#example-multi-cloud-cluster

resource "mongodbatlas_advanced_cluster" "testMultiCloudCluster" {
  project_id   = var.project_id
  name         = var.cluster_name
  cluster_type = "REPLICASET"

  replication_specs {
    region_configs {
      electable_specs {
        instance_size = "M10"
        node_count    = 3
      }
      analytics_specs {
        instance_size = "M10"
        node_count    = 1
      }
      provider_name = "AWS"
      priority      = 7
      region_name   = "US_EAST_1"
    }
    region_configs {
      electable_specs {
        instance_size = "M10"
        node_count    = 2
      }
      provider_name = "AZURE"
      priority      = 6
      region_name   = "US_EAST"
    }
  }
}