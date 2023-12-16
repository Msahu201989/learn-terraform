data "aws_ami" "ami" {
  name_regex  = "Centos-*"
  owners      = ["973714476881"]
}

