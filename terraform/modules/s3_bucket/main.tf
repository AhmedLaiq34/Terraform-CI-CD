terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}

resource "aws_s3_bucket" "this" {
  bucket = "${var.app_name}-${var.environment}"
}

resource "aws_s3_object" "index" {
  bucket = aws_s3_bucket.this.id
  key    = "index.html"
  source = "${path.root}/app/index.html"
}
