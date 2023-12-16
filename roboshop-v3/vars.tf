
variable "security_group" {
  default = [ "sg-061a8bc865ac300c4" ]
}

variable "zone_ID" {
  default = "Z03012723POIVATFERQS2"
}

variable "components" {
  default = {
    frontend = {
      name = "frontend"
      instance_type = "t2.micro"
    }
    cart = {
      name = "cart"
      instance_type = "t2.micro"
    }
  }
}