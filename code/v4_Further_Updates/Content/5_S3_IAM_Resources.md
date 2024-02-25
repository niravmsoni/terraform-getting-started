# What is required for our requirements for S3 and IAM?

    - Requirements?
        - Need to provision S3 bucket for website content & logging

    - Mapping with terraform AWS provider objects
    - S3 Resources
        - aws_s3_bucket
            - Create bucket
        - aws_s3_object
            - Objects in the bucket
    
    - Our EC2 instances need access to S3 bucket. WE will not give public access to S3 bucket
    - We will create IAM resource to grant access to EC2 isntances

    - Instance Access resources
        - aws_iam_role
            - Useful to grant role for instances
        - aws_iam_role_policy
            - Grant previously created role permission to bucket with this resource
        - aws_iam_instance_profile
            - Assign role to EC2 instance by creating this resource

    - Our LB also needs access to write logs to S3
    - Load balancer access
        - aws_s3_bucket_policy
            - Grant load balancer principal access with reference to below mentioned data source
        - aws_elb_service_account
            - Data source reference