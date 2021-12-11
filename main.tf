terraform {
  required_providers {
    oci = {
      source = "hashicorp/oci"
    }
  }
}

provider "oci" {
  tenancy_ocid        = var.compartment_id
  region              = var.region
  auth                = var.auth
  config_file_profile = var.config_file_profile

}

resource "oci_core_vcn" "vcn" {
  dns_label      = "internal"
  cidr_block     = "172.16.0.0/20"
  compartment_id = var.compartment_id
  display_name   = "Terraform-VCN"
}

resource "oci_core_subnet" "trial" {
  vcn_id                     = oci_core_vcn.vcn.id
  cidr_block                 = "172.16.0.0/24"
  compartment_id             = oci_core_vcn.vcn.compartment_id
  display_name               = "Terraform-subnet"
  prohibit_public_ip_on_vnic = true
  dns_label                  = "trialsub"

}