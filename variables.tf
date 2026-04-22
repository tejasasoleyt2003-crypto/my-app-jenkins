variable "vpc_cidr" { default = "10.0.0.0/16" }

variable "public_subnet_1" { default = "10.0.1.0/24" }
variable "public_subnet_2" { default = "10.0.2.0/24" }

variable "private_app_1" { default = "10.0.3.0/24" }
variable "private_app_2" { default = "10.0.4.0/24" }

variable "private_db_1" { default = "10.0.5.0/24" }
variable "private_db_2" { default = "10.0.6.0/24" }

variable "ami" { default = "ami-0f58b397bc5c1f2e8" }

variable "db_username" { default = "admin" }

variable "db_password" {
  description = "RDS password"
  sensitive   = true
}
