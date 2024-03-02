locals {
  common_tags = {
    company = var.company
    #Interpolated string
    project      = "${var.company}-${var.project}"
    billing_code = var.billing_code
    environment  = var.environment
  }

  # Creating a bucket name and appending random integer to the end of bucket name
  s3_bucket_name = "${lower(local.naming_prefix)}-${random_integer.s3.result}"

  # Adding new locals value for referencing inside For_each
  website_content = {
    website = "/website/index.html"
    logo    = "/website/Globo_logo_Vert.png"
  }

  naming_prefix = "${var.naming_prefix}-${var.environment}"
}

resource "random_integer" "s3" {
  min = 10000
  max = 99999
}