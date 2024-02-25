locals {
  common_tags = {
    company = var.company
    #Interpolated string
    project      = "${var.company}-${var.project}"
    billing_code = var.billing_code
  }

  # Creating a bucket name and appending random integer to the end of bucket name
  s3_bucket_name = "nirav-web-app-${random_integer_s3.result}"
}

resource "random_integer" "s3"{
  min = 10000
  max = 99999
}