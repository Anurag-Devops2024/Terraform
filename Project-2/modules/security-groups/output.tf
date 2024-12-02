output "security_groups_id" {
  value = aws_security_group.security_groups.id
}

output "securitygroup_name" {
  value = aws_vpc_security_group_ingress_rule.allow_tls_ipv4[*].cidr_ipv4
}