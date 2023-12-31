variable "components" {
  default = {                            ## THIS IS MAP as compared to count ##
    catalogue = { name = "catalogue_sg" }
    mongodb   = { name = "mongodb_sg" }
  }
}

resource "aws_security_group" "allow_tls" {
  for_each = var.components
  name     = lookup(var.components, each.value ["name"], null)  # ["name"] access a map variable & null if no data
}
