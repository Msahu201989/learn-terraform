#variable "ami" {
#  default = "ami-03265a0778a880afb"
#}
#variable "Security_group" {
#  default = [ "sg-061a8bc865ac300c4" ]
#}
#
#variable "Instance_type" {
#  default = "t2.micro"
#}
#
#variable "Zone_ID" {
#  default = "Z03012723POIVATFERQS2"
#}
#
#variable "components" {
#  default = {
#    frontend  = { name = "frontend-dev" }
#    catalogue = { name = "catalogue-dev" }
#    mongodb   = { name = "mongodb-dev" }
#    user      = { name = "user-dev" }
#    redis     = { name = "redis-dev" }
#    cart      = { name = "cart-dev" }
#    mysql     = { name = "mysql-dev" }
#    shipping  = { name = "shipping-dev" }
#    payment   = { name = "payment-dev" }
#    rabbitmq  = { name = "rabbitmq-dev" }
#  }
#}
#
#resource "aws_instance" "instance" {
#  for_each      = var.components
#  ami           = var.ami
#  instance_type = var.Instance_type
#  vpc_security_group_ids = var.Security_group
#
#  tags    = {
#    Name = lookup(each.value, "name", null)
#  }
#}
#
#resource "aws_route53_record" "record" {
#  for_each      = var.components
#  zone_id       = var.Zone_ID
#  name          = "${lookup(each.value, "name", null)}.msahu.online"
#  type          = "A"
#  ttl           = 30
#  records       = [lookup(lookup(aws_instance.instance, each.key, null), "private_ip", null)]
#}
#
#
#output "instances" {
#  value = "aws_instance.instance"
#}