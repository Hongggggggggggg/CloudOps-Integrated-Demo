variable "bucket_name" {
  description = "S3 bucket name"
  type        = string
}

variable "versioning_status" {
  description = "Versioning status for the S3 bucket"
  type = string
  default = "Enabled"
}
