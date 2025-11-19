terraform {
  backend "s3" {
    bucket = "terraform-state-bucket-varshapat"
    key    = "env/${terraform_workspace}/terraform.state"
    region = var.aws_region
   }

}

