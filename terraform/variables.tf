variable "cloud_id" {
  description = "Yandex cloud id"
  type        = string
  sensitive   = true
}

variable "cloudflare_api_token" {
  description = "cloudflare token"
  type        = string
  sensitive   = true
}

variable "folder_id" {
  description = "Devops-33 folder id"
  type        = string
  sensitive   = true
}

variable "numpw" {
  description = "Number of project work"
  type        = string
}

variable "yakey" {
  description = "yandex service account key file path"
  type        = string
}

variable "ya_cloud_init" {
  description = "yandex cloud init config file path"
  type        = string
  sensitive   = true
}

variable "zone" {
  description = "Default zone for resurces"
  type        = string
}

variable "cloudflare_zone_id" {
  description = "zone id of cloudflare"
  type        = string
  sensitive   = true
}

variable "platform_id" {
  description = "platform id"
  type        = string
  sensitive   = true
}

variable "image_family" {
  description = "image family"
  type        = map(any)
}