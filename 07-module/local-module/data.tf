data "aws_ami_ids" "ami" {
  name_regex  = "Centos-*"
  owners      = ["973714476881"]
}

output "ami" {
  value = data.aws_ami_ids.ami
}

resource "aws_instance" "instance" {

  ami                    = data.aws_ami_ids.ami.ids[0]
  instance_type          = var.instance_type
  vpc_security_group_ids = ["sg-061a8bc865ac300c4"]

}

variable "instance_type" {}