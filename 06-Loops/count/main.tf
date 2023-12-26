variable "components" {
  default = ["frontend", "mongodb", "catalogue"]  # we add instance here name will auto picked up
}

resource "aws_instance" "instance" {

  count = length(var.components) #here we are using loop Count + Length function

  ami           = "ami-03265a0778a880afb"
  instance_type = "t2.micro"
  vpc_security_group_ids = [ "sg-061a8bc865ac300c4" ]

  tags   = {
   // Name = var.components[count.index]
    Name = element(var.components, count.index )  # this is a Function we are using
  }
}
