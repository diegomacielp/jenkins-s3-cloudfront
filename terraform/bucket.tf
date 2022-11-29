resource "aws_s3_bucket" "bucket_redirect" {
  bucket = "www.${var.bucket["name"]}.${var.route53["zone_name"]}"
  tags   = local.common_tags
}
resource "aws_s3_bucket" "bucket_site" {
  bucket = "${var.bucket["name"]}.${var.route53["zone_name"]}"
  tags   = local.common_tags
}

resource "aws_s3_bucket_acl" "bucket_site_acl" {
  bucket = aws_s3_bucket.bucket_site.id
  acl    = "private"
}

resource "aws_s3_bucket_object" "bucket_object_index" {
  bucket = aws_s3_bucket.bucket_site.bucket
  key    = "index.html"
  source = "../index.html"
  tags   = local.common_tags
}

resource "aws_s3_bucket_policy" "bucket_policy_site" {
  bucket = aws_s3_bucket.bucket_site.id
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "Stmt1669508895038",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:GetObject",
      "Resource": [
        "${aws_s3_bucket.bucket_site.arn}",
        "${aws_s3_bucket.bucket_site.arn}/*"
      ]
    }
  ]
}
EOF
}

resource "aws_s3_bucket_website_configuration" "bucket_redirect_configuration" {
  bucket = aws_s3_bucket.bucket_redirect.bucket
  redirect_all_requests_to {
    host_name = "${var.bucket["name"]}.${var.route53["zone_name"]}"
  }
}
resource "aws_s3_bucket_website_configuration" "bucket_site_configuration" {
  bucket = aws_s3_bucket.bucket_site.bucket
  error_document {
    key = "error.html"
  }
  index_document {
    suffix = "index.html"
  }
}