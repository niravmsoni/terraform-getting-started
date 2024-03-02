# Module Structure
- Example - For building a module for an S3 bucket

```
s3/main.tf
variable "bucket_name"{}

resource "aws_s3_bucket" "main"{
    name = var.bucket_name
}

# Output BucketID so that the parent module can use it in its configuration
output "bucket_id"{
    value = aws_s3_bucket.main.id
}
```