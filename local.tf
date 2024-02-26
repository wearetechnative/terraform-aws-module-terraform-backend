locals {
  name          = length(var.name)          == 0 ? "" : "-${var.name}"
}
