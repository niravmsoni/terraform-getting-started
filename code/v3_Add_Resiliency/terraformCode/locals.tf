locals {
  common_tags = {
    company = var.company
    #Interpolated string
    project      = "${var.company}-${var.project}"
    billing_code = var.billing_code
  }
}