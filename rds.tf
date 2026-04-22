resource "aws_db_subnet_group" "db_subnet" {
  subnet_ids = [
    aws_subnet.private_db_1.id,
    aws_subnet.private_db_2.id
  ]
}

resource "aws_db_instance" "db" {
  allocated_storage = 20
  engine = "mysql"
  instance_class = "db.t3.micro"

  username = var.db_username
  password = var.db_password

  db_subnet_group_name = aws_db_subnet_group.db_subnet.name

  skip_final_snapshot = true
}
