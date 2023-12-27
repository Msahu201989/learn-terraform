variable "security_group" {
  default = ["sg-061a8bc865ac300c4"]
}

variable "ami_id" {
  default = "ami-03265a0778a880afb"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "component" {
  default = {
    frontend = {name = "frontend-dev" }
    catalogue = {name = "catalogue-dev" }
      }
}

resource "aws_instance" "Instance" {
  for_each = var.component
  ami           = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = var.security_group

  tags = {
    Name = lookup(each.value "name" , null)
  }
}