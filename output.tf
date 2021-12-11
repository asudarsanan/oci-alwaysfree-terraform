output "vcn_state" {
  description = "State of the VCN Created"
  value = oci_core_vcn.vcn.state
}
output "subnet_cidr" {
    description = "CIDR block for subnet"
    value = oci_core_subnet.trial.cidr_block
}