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

variable "availability_domain" {
  description = "Availbility Domain"
  type        = string
}

variable "ssh_authetication_key" {
  description = "SSH Key to attach to VM"
  type        = string
  sensitive   = true

}

variable "operating_system" {
  type        = string
  description = "Operating System Needed for Server"
}

variable "operating_system_version" {
  type        = string
  description = "Operating System Version"

}

variable "vcn_name" {
  type        = string
  description = "Virtual Cloud Network Name"
}

variable "ig_name" {
  type        = string
  description = "Internet Gateway Name"
}

variable "subnet_name" {
  type        = string
  description = "Subnet Name"

}

variable "route_table_name" {
  type        = string
  description = "Route Table Definition"
}

variable "dns_label" {
  type        = string
  description = "DNS Label for resolution"
}