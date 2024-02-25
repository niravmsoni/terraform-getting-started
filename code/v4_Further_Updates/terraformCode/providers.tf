##################################################################################
# PROVIDERS - Using AWS Provider
##################################################################################
# Set Provider, and specify accessKey, secretKey and default region
provider "aws" {
  region     = var.aws_region
}

