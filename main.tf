resource "aws_s3_bucket" "example" {
  bucket = var.bucket_name
  tags   = var.tags
#   depends_on = [aws_s3_bucket_ownership_controls.example  ]
#   policy = <<EOF
#   {
#     "Version": "2012-10-17",
#     "Statement": [
#         {
#             "Sid": "Statement1",
#             "Effect": "Allow",
#             "Principal": "*",
#             "Action": "s3:GetObject",
#             "Resource": "arn:aws:s3:::${var.bucket_name}/*"
#         }
#     ]
# }
# EOF    
}

# aws_s3_bucket_ownership_controls



resource "aws_s3_bucket_ownership_controls" "example" {
  bucket = aws_s3_bucket.example.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.example.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "example" {
  depends_on = [
    aws_s3_bucket_ownership_controls.example,
    aws_s3_bucket_public_access_block.example,
  ]

  bucket = aws_s3_bucket.example.id
  acl    = "public-read"
}


# resource "aws_s3_bucket_ownership_controls" "example" {
#   bucket = aws_s3_bucket.name.id
#   rule {
#     object_ownership = "BucketOwnerPreferred"
#   }
# }

# resource "aws_s3_bucket_public_access_block" "example" {
#   bucket = aws_s3_bucket.name.id

#   block_public_acls       = true
#   block_public_policy     = true
#   ignore_public_acls      = true
#   restrict_public_buckets = true
# }

# resource "aws_s3_bucket_acl" "example" {
#   depends_on = [
#     aws_s3_bucket_ownership_controls.example,
#     aws_s3_bucket_public_access_block.example,
#   ]

#   bucket = aws_s3_bucket.name.id
#   acl    = "public-read"
# }


# resource "aws_s3_bucket_versioning" "versioning_example" {
#   bucket = aws_s3_bucket.name.id
#   versioning_configuration {
#     status = "Enabled"
#   }

# resource "aws_s3_bucket_acl" "est_acl" {
#   depends_on = [aws_s3_bucket.name]

#   bucket = var.bucket_name
#   acl    = "public-read"
# }


# resource "aws_s3_bucket_policy" "allow_access_from_another_account" {
#   bucket = var.bucket_name
# policy = <<EOF
# {
#     "Version": "2012-10-17",
#     "Statement": [
#         {
#             "Sid": "Statement1",
#             "Effect": "Allow",
#             "Principal": "*",
#             "Action": "s3:GetObject",
#             "Resource": "arn:aws:s3:::mybucket-2werewda/*"
#         }
#     ]
# }
# EOF
# }


#   policy = data.aws_iam_policy_document.allow_all.json
# }

# data "aws_iam_policy_document" "allow_all" {
#   statement {
#     principals {
#       type        = "AWS"
#       identifiers = ["*"]
#     }

#     actions = [
#       "s3:GetObject",
#       "s3:ListBucket",
#     ]

#     resources = [
#       aws_s3_bucket.name.arn,
#       "${aws_s3_bucket.name.arn}/*",
#     ]
#   }
# }


resource "aws_s3_bucket_website_configuration" "s3_bucket_policy" {
  bucket = aws_s3_bucket.example.id
  index_document {
    suffix = "index.html"
  }
}





# resource "aws_s3_bucket_policy" "allow_access_from_another_account" {
#   bucket = aws_s3_bucket.example.id
#   policy = data.aws_iam_policy_document.allow_access_from_another_account.json
# }

# data "aws_iam_policy_document" "allow_all" {
#   statement {
#     principals {
#       type        = "AWS"
#       identifiers = ["123456789012"]
#     }

#     actions = [
#       "s3:GetObject",
#       "s3:ListBucket",
#     ]

#     resources = [
#       aws_s3_bucket.example.arn,
#       "${aws_s3_bucket.example.arn}/*",
#     ]
#   }
# }









#  resource "aws_s3_bucket" "s3_bucket" {
#    bucket = var.aws_region
#    policy = <<EOF
#  {
#      "Version": "2012-10-17",
#      "Statement": [
#          {
#              "Sid": "Statement1",
#              "Effect": "Allow",
#              "Principal": "*",
#              "Action": "s3:GetObject",
#              "Resource": "arn:aws:s3:::${var.aws_region}/*"
#          }
#      ]
#  }
#  EOF
#      website {
#          index_document = "index.html"
#          error_document = "error.html"
#      }
#  }
