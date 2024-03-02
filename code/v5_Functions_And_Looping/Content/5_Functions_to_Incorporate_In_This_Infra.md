# Functions to use
- Startup script
    - Right now, it is mentioned in heredoc format
    - Can use templatefile(file_location, {map of variables}) function
        - Reads contents of file and replaces variable in the file content that is read

- Extract subnet address from VPC CIDR
    - Right now, it is hard-coded
    - Can use cidrsubnet(cidr_range, subnet bits to add, network number) function

- For consistent naming of all resources
    - Add variable for naming prefix and adding name tag for each resource that doesn't have name argument
    - Can use merge(common_tags, {map of additional tags})

- S3 Bucket name
    - Apply lower("bucket_name") function to make sure bucket name is always in lower case