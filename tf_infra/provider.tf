terraform {
  required_providers {
    aws =  {
    source = "hashicorp/aws"
    version = "~> 5.0"
  }
  }

  backend "s3" {
    bucket = "terraform-state-bucket-varshapat"
    key    = "terraform-state-bucket-varshapat/terraform.state"
    region = var.aws_region
   }

  required_version = ">= 1.0.0"

}