output "ec2_public_ip" {
  value = aws_instance.devsecops_ec2.public_ip
}
