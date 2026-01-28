output "bucket_name" {
  description = "The S3 bucket name"
  value       = aws_s3_bucket.this.id
}

output "bucket_url" {
  description = "URL to the index.html file in the bucket"
  value       = "http://localhost:4566/${aws_s3_bucket.this.id}/index.html"
}
