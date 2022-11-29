/*resource "aws_route53_zone" "route53_zone_site" {
  name = var.route53["zone_name"]
}

resource "aws_route53_record" "route53_record_site" {
  name       = "${var.bucket["name"]}.${var.route53["zone_name"]}"
  records    = [aws_s3_bucket.bucket_site.website_endpoint]
  ttl        = 300
  type       = "CNAME"
  zone_id    = aws_route53_zone.route53_zone_site.zone_id
}

resource "aws_route53_record" "route53_record_www" {
  name       = "www.${var.bucket["name"]}.${var.route53["zone_name"]}"
  records    = [aws_route53_record.route53_record_site.fqdn]
  ttl        = 300
  type       = "CNAME"
  zone_id    = aws_route53_zone.route53_zone_site.zone_id
}*/