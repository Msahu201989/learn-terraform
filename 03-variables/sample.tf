# Plain variable
variable "fruits_name" {
  default = "apple"
}

output "fruits_name" {
  value = var.fruit_name
}

# List Variable
variable "fruits" {
  default = [
  "apple",
  "banana"
  ]
#  default = ["apple", "banana" ] ?? single line syntax
}

# map variable Plain

variable "fruits_stock" {
  default = {
    apple = 100
    banana = 200
  }
}

#Map variable , Map of Maps
variable "fruits_stock_with_price" {
  default = {
    apple = {
      stock = 100
      price = 3
    }
    banana = {
      stock = 400
      price = 1
    }
  }
}

# Acces List of variable list index starts from Zero

output "fruits_first" {
  value = var.fruits[0]
}