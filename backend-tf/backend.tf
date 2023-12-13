# Create S3 bucket
resource "aws_s3_bucket" "terraform_state" {
  bucket        = "dev-tfstate2023"
  force_destroy = true

  lifecycle {
    prevent_destroy = false # Should be set to true
  }
}

resource "aws_s3_bucket_versioning" "terraform_state" {
  bucket = aws_s3_bucket.terraform_state.id
  versioning_configuration {
    status = "Enabled"
  }
}

# resource "aws_dynamodb_table" "terraform_state_lock" {
#   name           = "dev-state"
#   read_capacity  = 1
#   write_capacity = 1
#   hash_key       = "LockID"

#   attribute {
#     name = "LockID"
#     type = "S"
#   }
# }

# resource "aws_s3_bucket_policy" "terraform_state" {
#   bucket = "${aws_s3_bucket.terraform_state.id}"
#   policy =<<EOF
#   {
#     "Version": "2012-10-17",
#     "Statement": [
#       {
#         "Sid": "Stmt1702411280633",
#         "Action": [
#           "s3:List*",
#           "s3:Get*",
#           "s3:Delete*",
#           "s3:PutObject"
#         ],
#         "Effect": "Allow",
#         "Resource": "arn:aws:s3:::dev-state2023/*",
#         "Principal": {
#           "AWS": [
#             "*"
#           ]
#         }
#       }
#     ]
    
#   }
#   EOF
# }