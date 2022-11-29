resource "aws_route53_record" "route53_record_certificate_site" {
  allow_overwrite = true
  name            = tolist(aws_acm_certificate.certificate_site.domain_validation_options)[0].resource_record_name
  provider        = aws.region1
  records         = [tolist(aws_acm_certificate.certificate_site.domain_validation_options)[0].resource_record_value]
  ttl             = 60
  type            = tolist(aws_acm_certificate.certificate_site.domain_validation_options)[0].resource_record_type
  zone_id         = var.route53["zone_id"]
}

resource "aws_route53_record" "route53_record_site" {
  name       = "${var.bucket["name"]}.${var.route53["zone_name"]}"
  records    = [aws_cloudfront_distribution.cloudfront_distribution_site.domain_name]
  ttl        = 300
  type       = "CNAME"
  zone_id    = var.route53["zone_id"]
}