resource "aws_cloudfront_distribution" "cloudfront_distribution_site" {
  aliases = ["${var.bucket["name"]}.${var.route53["zone_name"]}"]
  default_cache_behavior {
    allowed_methods        = ["GET", "HEAD"]
    cached_methods         = ["GET", "HEAD"]
    cache_policy_id        = "658327ea-f89d-4fab-a63d-7e88639e58f6"
    compress               = true
    target_origin_id       = aws_s3_bucket.bucket_site.bucket_regional_domain_name
    viewer_protocol_policy = "redirect-to-https"
  }
  default_root_object = "index.html"
  enabled             = true
  origin {
    domain_name = aws_s3_bucket.bucket_site.bucket_regional_domain_name
    origin_id   = aws_s3_bucket.bucket_site.bucket_regional_domain_name
    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.origin_access_identity.cloudfront_access_identity_path
    }
  }
  price_class = "PriceClass_All"
  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }
  tags = local.common_tags
  viewer_certificate {
    acm_certificate_arn      = aws_acm_certificate.certificate_site.arn
    minimum_protocol_version = "TLSv1.2_2021"
    ssl_support_method       = "sni-only"
  }
}

resource "aws_cloudfront_origin_access_identity" "origin_access_identity" {
  comment = aws_s3_bucket.bucket_site.bucket_regional_domain_name
}