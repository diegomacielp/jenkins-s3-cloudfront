resource "aws_s3_bucket" "bucket_web" {
  bucket = "${var.bucket["name"]}-${random_pet.bucket.id}"
  tags   = local.common_tags
}

resource "aws_s3_bucket_acl" "bucket_acl_web" {
  bucket = aws_s3_bucket.bucket_web.id
  acl    = var.bucket["acl"]
}

resource "aws_s3_bucket_website_configuration" "example" {
  bucket = aws_s3_bucket.bucket_web.bucket

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

  routing_rule {
    condition {
      key_prefix_equals = "docs/"
    }
    redirect {
      replace_key_prefix_with = "documents/"
    }
  }
}