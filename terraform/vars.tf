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
    "region" = "us-east-2"
  }
  type = map(string)
}