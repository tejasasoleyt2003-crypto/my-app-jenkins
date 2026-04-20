resource "aws_instance" "jenkins" {
  ami           = "ami-0f5ee92e2d63afc18" # Ubuntu ap-south-1
  instance_type = var.instance_type

  subnet_id              = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.jenkins_sg.id]
  iam_instance_profile   = aws_iam_instance_profile.jenkins_profile.name

  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install -y docker.io openjdk-17-jdk curl unzip

              systemctl start docker
              systemctl enable docker

              # Install Jenkins
              curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | tee \
              /usr/share/keyrings/jenkins-keyring.asc > /dev/null

              echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
              https://pkg.jenkins.io/debian-stable binary/ | tee \
              /etc/apt/sources.list.d/jenkins.list > /dev/null

              apt update -y
              apt install -y jenkins
              systemctl start jenkins
              systemctl enable jenkins

              usermod -aG docker jenkins
              EOF

  tags = {
    Name = "jenkins-server"
  }
}