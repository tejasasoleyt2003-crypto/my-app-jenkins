output "jenkins_url" {
  value = "http://${aws_instance.jenkins.public_ip}:8080"
}

output "ecr_repo_url" {
  value = aws_ecr_repository.app_repo.repository_url
}