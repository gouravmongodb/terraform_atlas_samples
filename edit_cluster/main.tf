# Cluster to pull the configs from and edit it
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

  # Pause the cluster when required, true or false
  paused = var.pause_cluster
}

# Add a new cluster alert config
resource "mongodbatlas_alert_configuration" "test" {
  project_id = var.project_id
  event_type = "REPLICATION_OPLOG_WINDOW_RUNNING_OUT"
  enabled    = true

  notification {
    type_name     = "GROUP"
    interval_min  = 5
    delay_min     = 0
    sms_enabled   = false
    email_enabled = true
    roles         = ["GROUP_CLUSTER_MANAGER"]
  }

  matcher {
    field_name = "CLUSTER_NAME"
    operator   = "EQUALS"
    value      = var.cluster_name
  }

  threshold_config {
    operator    = "LESS_THAN"
    threshold   = 1
    units       = "HOURS"
  }
}

# Add new IP address to access a project
resource "mongodbatlas_project_ip_access_list" "my_ip" {
  for_each    = { for i, v in var.ip_access_list : i => v }
  project_id  = var.project_id
  ip_address  = each.value.ip_address
  comment     = each.value.comment
}

# Add a new custom role
resource "mongodbatlas_custom_db_role" "audit_service_role" {
  project_id = var.project_id # Replace with your project ID
  role_name  = "A-SVC-AUDIT-SERVICE"

  actions {
    action         = "USE_UUID"
    resources {
      cluster = true
    }
  }

  actions {
    action         = "SERVER_STATUS"
    resources {
      cluster = true
    }
  }

  actions {
    action         = "FIND"
    resources {
      database_name   = "audit_service" # use the empty string ("") to allow an action on all databases.
      collection_name = ""
    }
  }

  actions {
    action         = "INSERT"
    resources {
      database_name   = "audit_service"
      collection_name = ""
    }
  }

  actions {
    action         = "REMOVE"
    resources {
      database_name   = "audit_service"
      collection_name = ""
    }
  }

  actions {
    action         = "UPDATE"
    resources {
      database_name   = "audit_service"
      collection_name = ""
    }
  }
}

# Add a new custom role
resource "mongodbatlas_custom_db_role" "deploy_liquibase_pims_cloud" {
  project_id = var.project_id
  role_name  = "A-SVC-DEPLOY-LIQUIBASE-PIMS-CLOUD"

  # Cluster-level actions
  actions {
    action = "USE_UUID"
    resources {
      cluster = true
    }
  }

  actions {
    action = "SERVER_STATUS"
    resources {
      cluster = true
    }
  }

  actions {
    action = "LIST_DATABASES"
    resources {
      cluster = true
    }
  }

  # Dynamic actions applied to specified databases
  dynamic "actions" {
    for_each = var.actions_list
    content {
      action = actions.value

      dynamic "resources" {
        for_each = var.databases
        content {
          database_name   = resources.value
          collection_name = ""
        }
      }
    }
  }

  # Inherited role
  inherited_roles {
    role_name     = "readWriteAnyDatabase"
    database_name = "admin"
  }
}

# Import a existing custom role
resource "mongodbatlas_custom_db_role" "migrate_role" {
  project_id = var.project_id
  role_name  = "migrateRole"

  actions {
    action = "BYPASS_USER_WRITE_BLOCK"
    resources {
      cluster = true
    }
  }
}

# Add new database user
resource "mongodbatlas_database_user" "test" {
  username           = "test-acc-username"
  password           = "test-acc-password"
  project_id         = var.project_id
  auth_database_name = "admin"

  roles {
    role_name     = "readWrite"
    database_name = "admin"
  }

  roles {
    role_name     = "readAnyDatabase"
    database_name = "admin"
  }

  labels {
    key   = "My Key"
    value = "My Value"
  }

  scopes {
    name   = var.cluster_name
    type = "CLUSTER"
  }

  roles {
    role_name     = mongodbatlas_custom_db_role.audit_service_role.role_name
    database_name = "admin"
  }

  roles {
    role_name     = mongodbatlas_custom_db_role.deploy_liquibase_pims_cloud.role_name
    database_name = "admin"
  }

}
