module "components" {

  for_each  = var.components

  source              = "./module"
  zone_id             = var.zone_ID
  security_group      = var.security_group
  name                = each.value["name"]
  instance_type       = each.value["instance_type"]

}

