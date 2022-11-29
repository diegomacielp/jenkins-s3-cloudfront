resource "aws_acm_certificate" "certificate_site" {
  domain_name = "${var.bucket["name"]}.${var.route53["zone_name"]}"
  lifecycle {
    create_before_destroy = true
  }
  provider          = aws.region1
  tags              = local.common_tags
  validation_method = "DNS"
}

resource "aws_acm_certificate_validation" "certificate_validation_site" {
  certificate_arn         = aws_acm_certificate.certificate_site.arn
  provider                = aws.region1
  validation_record_fqdns = [aws_route53_record.route53_record_certificate_site.fqdn]
}