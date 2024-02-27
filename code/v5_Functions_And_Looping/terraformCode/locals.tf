locals {
  common_tags = {
    company = var.company
    #Interpolated string
    project      = "${var.company}-${var.project}"
    billing_code = var.billing_code
  }

  # Creating a bucket name and appending random integer to the end of bucket name
  s3_bucket_name = "nirav-web-app-${random_integer.s3.result}"

  # Adding new locals value for referencing inside For_each
  website_content = {
    website = "/website/index.html"
    logo = "/website/Globo_logo_Vert.png"
  }
}

resource "random_integer" "s3" {
  min = 10000
  max = 99999
}