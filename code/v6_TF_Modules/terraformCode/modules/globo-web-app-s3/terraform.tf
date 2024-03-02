# Optional. But its good practise to have this since tomorrow if we decide to publish this to registry or share this module with anyone else, they should know which version (TF and Provider) we have used to validate the code against?
terraform {
  required_version = ">=1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}