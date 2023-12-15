# Create S3 bucket
resource "aws_s3_bucket" "terraform_aws_state" {
  bucket        = "dev-aws-tfstate-12"
  force_destroy = true
  # region        = "us-east-1"

  lifecycle {
    prevent_destroy = false # Should be set to true
  }
}

# Add resource versionong
resource "aws_s3_bucket_versioning" "terraform_aws_state" {
  bucket = aws_s3_bucket.terraform_aws_state.id
  versioning_configuration {
    status = "Enabled"
  }
}

# Add lock to prevent state corruption due to simultanous change push
resource "aws_dynamodb_table" "terraform_state_lock" {
  name           = "dev_aws_lockid"
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}

# Add s3 policy
resource "aws_s3_bucket_policy" "terraform_aws_state" {
  bucket = "${aws_s3_bucket.terraform_aws_state.id}"
  policy =<<EOF
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Sid": "Stmt1702411280633",
        "Principal": "*",
        "Effect": "Allow",
        "Action": [
          "s3:List*",
          "s3:Delete*",
          "s3:PutObject",
          "s3:GetObject",
          "s3:GetObjectVersion"
        ],
        "Resource": "arn:aws:s3:::dev-aws-tfstate-12/*"
      }
    ]
  }
  EOF
}

# Remove public access block
resource "aws_s3_bucket_public_access_block" "terraform_aws_state" {
  bucket = aws_s3_bucket.terraform_aws_state.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
  depends_on = [ aws_s3_bucket.terraform_aws_state ]
}