variable "compartment_id" {
  description = "OCID from your tenency page"
  type        = string
}
variable "region" {
  description = "Your OC Region"
  type        = string
  default     = "eu-amsterdam-1"
}
variable "auth" {
  description = "authentication type"
  type        = string
}
variable "config_file_profile" {
  description = "config profile for OCI"
  type        = string

}