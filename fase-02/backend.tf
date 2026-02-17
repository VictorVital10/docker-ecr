# This file defines where the Terraform state file will be stored (S3).

terraform {
    backend "s3" {
      bucket = "terraform-state-vav"
      key = "site/terraform.tfstate"
      region = "sa-east-1" 
      encrypt = true
    }
}