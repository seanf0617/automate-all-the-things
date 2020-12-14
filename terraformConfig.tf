terraform {
 backend "s3" {
   bucket = "automate-all-the-things-terraform-state"
   key = "global/s3/terraform.tfstate"
   region = "us-east-2"
   dynamodb_table = "automate-all-the-things-terraform-locks"
   encrypt = true
   access_key = var.deployment_username
   secret_key = var.deployment_password
  }
}
