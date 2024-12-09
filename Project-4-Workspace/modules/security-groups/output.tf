# output "ingress_ipv4_ssh" {
#   value = aws_security_group.security_group.id
# }

# output "ingress_ipv4_port80" {
#   value = aws_security_group.security_group.id
# }

# output "egress_ipv4_ssh" {
#   value = aws_security_group.security_group.id
# }

output "aws_security_group" {
  value = aws_security_group.security_group.id
}
