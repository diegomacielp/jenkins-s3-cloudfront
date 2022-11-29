# BUCKET
variable "bucket" {
  default = {
    "acl"  = "private"
    "name" = "test"
  }
  type = map(string)
}
# PROVIDER
variable "aws" {
  default = {
    "region1" = "us-east-1"
    "region2" = "us-east-2"
  }
  type = map(string)
}
# ROUTE 53
variable "route53" {
  default = {
    "zone_name" = "tallos.com.br"
  }
  type = map(string)
}