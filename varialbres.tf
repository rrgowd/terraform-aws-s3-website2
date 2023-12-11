variable "bucket_name" {
  description = "this is env"
  type        = string
}

variable "tags" {
  description = "This is for tags"
  type        = map(string)
  default     = {}
}




variable "aws_region" {
  description = "This is db user id"
  type        = string
  default     = "us-east-1"
}


# variable "pass" {
#   description = "This is db user id"
#   type = string
#   sensitive = true
# }