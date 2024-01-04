variable "ami_id" {
  default = jdlkdjkada
}

resource "aws_instance" "instance" {
  ami = var.ami_id
  instance_type = "t3.micro"
  vpc_security_group_ids = ["sg-eddewdewdewd"]
tags = {
  Name = "test"
}
}

