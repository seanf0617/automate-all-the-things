provider "aws" {
  region="us-east-2"
}

resource "aws_s3_bucket" "terraform_state"{
    bucket = "automate-all-the-things-terraform-state"
    
    versioning {
      enabled = true  
    }
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

resource "aws_dynamo_table" "terraform_state_locks" {
  name = "automate-all-the-things-terraform-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key = "LockID"
  
  attribute {
    name = "LockID"
    type = "S"
  }
}
