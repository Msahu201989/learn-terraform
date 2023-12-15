variable "ami" {
  default = "ami-03265a0778a880afb"
}
variable "Security_group" {
  default = [ "sg-061a8bc865ac300c4" ]
}

variable "Instance_type" {
  default = "t2.micro"
}

variable "Zone_ID" {
  default = "Z03012723POIVATFERQS2"
}

variable "components" {
  default = {
    frontend  = {}
    catalogue = {}
    mongodb   = {}
    user      = {}
    redis     = {}
    cart      = {}
    mysql     = {}
    shipping  = {}
    payment   = {}
    rabbitmq  = {}

  }

}


resource "aws_instance" "instance" {
  for_each      = var.components
  ami           = var.ami
  instance_type = var.Instance_type
  vpc_security_group_ids = var.Security_group

  tags    = {
    Name  = lookup(var.components, each.key, null)
  }
}

#resource "aws_route53_record" "record" {
#  for_each      = var.components
#  zone_id       = var.Zone_ID
#  name          = "frontend.msahu.online"
#  type          = "A"
#  records       = [lookup(aws_instance.instance,each.key[""]]
#}
#

output "instances" {
  value = "aws_instance.instance"
}