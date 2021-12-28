output "vcn_state" {
  description = "State of the VCN Created"
  value       = oci_core_vcn.vcn.state
}
output "subnet_cidr" {
  description = "CIDR block for subnet"
  value       = oci_core_subnet.teratetrra_subnet_pub.cidr_block
}
output "subnet_ocid" {
  description = "OCID of SUBNET"
  value       = oci_core_subnet.teratetrra_subnet_pub.id

}

output "server_publicip" {
  description = "Server Public IP"
  value       = module.A1-Always-Free-Instance.public_ip
}