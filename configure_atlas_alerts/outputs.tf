
# https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/cluster#example---return-a-connection-string
output "standard" {
    value = mongodbatlas_cluster.example_cluster.connection_strings[0].standard
}

output "standard_srv" {
    value = mongodbatlas_cluster.example_cluster.connection_strings[0].standard_srv
}

# Private with Network peering and Custom DNS AWS enabled
#output "private" {
#    value = mongodbatlas_cluster.example_cluster.connection_strings[0].private
#}

# Private srv with Network peering and Custom DNS AWS enabled
#output "private_srv" {
#    value = mongodbatlas_cluster.example_cluster.connection_strings[0].private_srv
#}

