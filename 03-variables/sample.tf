# Plain variable
variable "fruits_name" {
  default = "apple"
}

output "fruits_name" {
  value = var.fruits_name
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

## Access a list variable, List index starts from zero
output "fruits_first" {
  value = var.fruits[0]
  // value = element(var.fruits, 0)
}

output "fruits_second" {
  value = var.fruits[1]
}

## Access a Map Variable
output "fruit_stock_apple" {
  value = var.fruits_stock["apple"]
}

output "fruit_stock_with_price_of_apple" {
  value = var.fruits_stock_with_price["apple"].stock
}

# variable data Types
variable "fruits_details" {
  default = {
    apple = {
      stock = 100         # Number
      type = "Washington" # String
      for_sale = true     # Boolean

   }
  }
}

# Variable in a combination of any other string then it needs to be with in  ${}
output "fruits_name_1" {
  value = "Fruit Name = ${var.fruits_name}"
}


output "fruit_details_apple" {
  value = "Apple Stock = ${var.fruits_details["apple"].stock} , Apple Type = ${var.fruits_details["apple"].type}, Apple Sale Status = ${var.fruits_details["apple"].for_sale}"
}