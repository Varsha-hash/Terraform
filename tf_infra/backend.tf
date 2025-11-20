terraform {
  backend "s3" {
    # bucket = "terraform-state-bucket-varshapat"
    # key    = "env/${terraform_workspace}/terraform.state"
    # region = var.aws_region
   }

}

# Why variables don’t work in backend configuration

# The backend block is processed before Terraform loads variables and evaluates the rest of the configuration.
# Terraform needs to know where to store the state file before it can even read variables from *.tfvars or variables.tf.
# So, the backend configuration must be static or provided via:

# terraform init CLI flags
# -backend-config files
# Environment variables