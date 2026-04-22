resource "aws_launch_template" "app" {
  name_prefix = "app"

  image_id = var.ami
  instance_type = "t2.micro"

  vpc_security_group_ids = [aws_security_group.app_sg.id]

  user_data = base64encode(<<EOF
#!/bin/bash
yum update -y
yum install -y docker
systemctl start docker
docker run -d -p 3000:3000 nginx
EOF
)
}
