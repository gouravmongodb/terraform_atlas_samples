variable "atlas_public_key" {
  description = "MongoDB Atlas Public API Key"
  type        = string
}

variable "atlas_private_key" {
  description = "MongoDB Atlas Private API Key"
  type        = string
}

variable "atlas_org_id" {
  description = "MongoDB Atlas Organization ID"
  type        = string
}

variable "project_id" {
  description = "Project/Group ID of the MongoDB Atlas Project"
  type        = string
}

variable "project_name" {
  description = "Name of the MongoDB Atlas Project"
  type        = string
}

variable "cluster_name" {
  description = "Name of the MongoDB Atlas Cluster"
  type        = string
}
