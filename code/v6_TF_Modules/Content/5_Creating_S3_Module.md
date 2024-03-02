# S3 Module
- Input variables - variables.tf
    - bucket_name - Name of bucket
    - elb_service_account_arn - ARN of ELB Service account
    - common_tags - Tags

- Resources - main.tf
    - aws_s3_bucket
    - aws_s3_bucket_policy
    - aws_iam_role
    - aws_iam_role_policy
    - aws_iam_instance_profile

- Outputs - outputs.tf
    - web_bucket - Full bucket object
    - instance_profile - Full instance profile object
    