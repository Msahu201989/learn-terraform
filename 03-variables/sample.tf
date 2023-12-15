# Plain Variable
variable "fruit_name" {
  default = "apple"
}

output "fruit_name" {
  value = var.fruit_name
}

# List Variable
variable "fruits" {
  default = [
    "apple",
    "banana"
  ]
  // default = [ "apple", "banana" ] // Single line syntax
}

# Map Variable , Plain
variable "fruit_stock" {
  default = {
    apple  = 100
    banana = 200
  }
}

# Map Variable, Map of Maps
variable "fruit_stock_with_price" {
  default = {
    apple = {
      stock = 200
      price = 3
    }
    banana = {
      stock = 400
      price = 1
    }
  }
}

## Access a list variable, List index starts from zero
output "fruits_first" {
  value = var.fruits[0]
  // value = element(var.fruits, 0)
}