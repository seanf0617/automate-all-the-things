terraform {
 backend "s3" {
   bucket = "automate-all-the-things-terraform-state"
   key = "global/s3/terraform.tfstate"
   region = "us-east-1"
   dynamodb_table = "automate-all-the-things-terraform-locks"
   encrypt = true
  }
}
