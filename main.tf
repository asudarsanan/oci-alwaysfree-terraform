module "A1-Always-Free-Instance" {
  source                   = "adarobin/A1-Always-Free-Instance/oci"
  version                  = "0.2.0"
  ocpus                    = 4
  memory_in_gbs            = 24
  boot_volume_size_in_gbs  = 200
  hostname                 = "tetraterra"
  compartment_id           = var.compartment_id
  availability_domain      = var.availability_domain
  operating_system         = var.operating_system
  operating_system_version = var.operating_system_version
  subnet_id                = oci_core_subnet.teratetrra_subnet_pub.id
  ssh_authorized_keys      = var.ssh_authetication_key
  assign_public_ip         = true

}

provider "oci" {
  tenancy_ocid        = var.compartment_id
  region              = var.region
  auth                = var.auth
  config_file_profile = var.config_file_profile

}

resource "oci_core_vcn" "vcn" {
  dns_label      = var.dns_label
  cidr_block     = "172.16.0.0/20"
  compartment_id = var.compartment_id
  display_name   = var.vcn_name
}

resource "oci_core_internet_gateway" "tetraterra_ig" {
  compartment_id = var.compartment_id
  display_name   = var.ig_name
  vcn_id         = oci_core_vcn.vcn.id
}

resource "oci_core_default_route_table" "default_route_table" {
  manage_default_resource_id = oci_core_vcn.vcn.default_route_table_id
  display_name               = var.route_table_name

  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_internet_gateway.tetraterra_ig.id
  }
}

resource "oci_core_subnet" "teratetrra_subnet_pub" {
  vcn_id                     = oci_core_vcn.vcn.id
  cidr_block                 = "172.16.0.0/24"
  compartment_id             = oci_core_vcn.vcn.compartment_id
  display_name               = var.subnet_name
  prohibit_public_ip_on_vnic = false
  dns_label                  = var.dns_label

}
