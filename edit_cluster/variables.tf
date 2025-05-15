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

variable "pause_cluster" {
  description = "Pause the cluster when required"
  type        = bool
}

variable "ip_access_list" {
  type = list(object({
    ip_address = string
    comment    = string
  }))
}

variable "databases" {
  type = list(string)
  default = [
    "ai_service",
    "aisuggestions_service",
    "audit_service",
    "pulse_appointment_summaries",
    "qa_automation_svcs",
    "sms_replies",
    "sms_service",
    "smschat_service",
    "smsreplies_service",
    "treatmentboard_service",
    "user_search_history_service"
  ]
}

variable "actions_list" {
  type = list(string)
  default = [
    "FIND",
    "INSERT",
    "REMOVE",
    "UPDATE",
    "BYPASS_DOCUMENT_VALIDATION",
    "CREATE_COLLECTION",
    "CREATE_INDEX",
    "DROP_COLLECTION",
    "CHANGE_STREAM",
    "COLL_MOD",
    "COMPACT",
    "CONVERT_TO_CAPPED",
    "DROP_INDEX",
    "RE_INDEX",
    "COLL_STATS",
    "DB_HASH",
    "LIST_INDEXES",
    "VALIDATE"
  ]
}