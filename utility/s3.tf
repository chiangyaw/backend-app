#Secret S3 Bucket
resource "aws_s3_bucket" "aattack-path-secret-s3-bucket" {
  bucket        = "aattack-path-secret-s3-bucket-${var.ebillingid}"
  force_destroy = true
  tags = {
    Name        = "aattack-path-secret-s3-bucket-${var.ebillingid}"
    Description = "ebilling ${var.ebillingid} S3 Bucket used for storing a secret"
    Stack       = "${var.stack-name}"
    Scenario    = "${var.scenario-name}"
    yor_trace   = "c223bc6f-dc0d-4abe-903f-5636cd06beb1"
  }
}

resource "aws_s3_bucket_object" "aattack-path-shepards-credentials" {
  bucket = "${aws_s3_bucket.aattack-path-secret-s3-bucket.id}"
  key    = "admin-user.txt"
  source = "./admin-user.txt"
  tags = {
    Name      = "aattack-path-shepards-credentials-${var.ebillingid}"
    Stack     = "${var.stack-name}"
    Scenario  = "${var.scenario-name}"
    yor_trace = "587e817b-4bd0-4ee7-b797-bb5abfa2b986"
  }
}

data "aws_canonical_user_id" "current" {}

resource "aws_s3_bucket" "finance-secret-s3-bucket" {
  bucket        = "finance-secret-${var.ebillingid}"
  force_destroy = true
  tags = {
    Name        = "finance-secret-${var.ebillingid}"
    Description = "ebilling ${var.ebillingid} S3 Bucket used for storing a secret"
    Stack       = "${var.stack-name}"
    Scenario    = "${var.scenario-name}"
    yor_trace   = "3da4fd29-e38c-44c4-8940-9b8f93f17e0f"
  }
}

resource "aws_s3_bucket_ownership_controls" "finance-bucket_ownership_controls" {
  bucket = aws_s3_bucket.finance-secret-s3-bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "finance-bucket_public_access_block" {
  bucket = aws_s3_bucket.finance-secret-s3-bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}


resource "aws_s3_bucket_acl" "finance-bucket_bucket_acl" {
  depends_on = [
    aws_s3_bucket_ownership_controls.finance-bucket_ownership_controls,
    aws_s3_bucket_public_access_block.finance-bucket_public_access_block,
  ]

  bucket = aws_s3_bucket.finance-secret-s3-bucket.id
  acl    = "public-read"
}

resource "aws_s3_bucket_object" "s3_public_objects" {
  bucket        = "${aws_s3_bucket.finance-secret-s3-bucket.id}"
  force_destroy = true
  tags = {
    Name        = "finance-secret-s3-bucket-${var.ebillingid}-public"
    Description = "ebilling ${var.ebillingid} S3 Bucket used for storing a secret"
    Stack       = "${var.stack-name}"
    Scenario    = "${var.scenario-name}"
    yor_trace   = "3e410219-adab-4df1-8936-9ee415bd943e"
  }
  key          = "admin-user.txt"
  source       = "./admin-user.txt"
  content_type = "text/plain"
}