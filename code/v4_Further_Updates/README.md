# What's changing in V4?

    - Requirements
        - Copy website content
        - Log traffic (Request logging) to S3 bucket
        - Use specific provider versions
        - Properly format files

    - Steps to take
        - Provision S3 bucket and upload static content there
        - Assign profile to EC2 instance that has access to copy information from S3
        - Load balancer configuration supports logging to S3. We will use same bucket and grant LB principal access to write files
        
