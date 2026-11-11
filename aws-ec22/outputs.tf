output "ec2_public-ip" {
  value = aws_instance.WebServer[*].public_ip
}

output "ec2_public-dns" {
  value = aws_instance.WebServer[*].public_dns
}