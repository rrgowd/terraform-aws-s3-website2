output "arn" {
  description = "ARN of the s3"
  value       = aws_s3_bucket.example.arn
}

output "example" {
  description = "THis is buket example"
  value       = aws_s3_bucket.example.id
}

output "domain" {
  description = "Domain example if bucket"
  value       = aws_s3_bucket.example.website_domain
}

output "endpoint" {
  description = "This is for website endpoint"
  value       = aws_s3_bucket.example.website_endpoint
}