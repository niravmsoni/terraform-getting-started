locals {
  common_tags = {
    company = var.company
    #Interpolated string
    project      = "${var.company}-${var.project}"
    billing_code = var.billing_code
  }
}

resource "random_integer" "s3"{
  min = 10000
  max = 99999
}