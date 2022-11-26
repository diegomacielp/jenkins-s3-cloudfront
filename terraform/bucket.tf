resource "aws_s3_bucket" "bucket_web" {
  bucket = "${var.bucket["name"]}-${random_pet.bucket.id}"
  tags   = local.common_tags
  acl = "private"  
}

/*resource "aws_s3_bucket_acl" "bucket_acl_web" {
  bucket = aws_s3_bucket.bucket_web.id
  acl    = var.bucket["acl"]
}*/