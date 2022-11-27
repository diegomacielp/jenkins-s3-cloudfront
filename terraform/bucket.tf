resource "aws_s3_bucket" "bucket_site" {
  bucket = "${var.bucket["name"]}-${random_pet.bucket.id}"
  tags   = local.common_tags
}

resource "aws_s3_bucket_acl" "bucket_site_acl" {
  bucket = aws_s3_bucket.bucket_site.id
  acl    = "private"
}

resource "aws_s3_bucket_website_configuration" "bucket_site_configuration" {
  bucket = aws_s3_bucket.bucket_site.bucket

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

  /*routing_rule {
    condition {
      key_prefix_equals = "docs/"
    }
    redirect {
      replace_key_prefix_with = "documents/"
    }
  }*/
}