output "vpc_id" {
  value = aws_vpc.local.id
}

output "subnet_id_1" {
  value = aws_subnet.public_a.id
}

output "subnet_id_2" {
  value = aws_subnet.public_b.id
}

output "security_group_id" {
  value = aws_security_group.alb.id
}
