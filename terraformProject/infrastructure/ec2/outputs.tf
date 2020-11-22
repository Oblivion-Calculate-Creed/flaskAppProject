output "security_group_id" {
  value = aws_security_group.security_group_A.id
}
output "jenkins_ip" {
  value = aws_instance.jenkins.public_ip
}