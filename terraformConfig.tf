terraform {
 backend "s3" {
   bucket = "automate-all-the-things-terraform-state"
   key = "global/s3/terraform.tfstate"
   region = "us-east-2"
   dynamodb_table = "automate-all-the-things-terraform-locks"
   encrypt = true
   access_key = "AKIAI465OW3YDTNC7L6Q"
   secret_key = "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"
  }
}
