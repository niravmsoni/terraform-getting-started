### Terraform
    - Infrasturcture automation tool
    - Open source - Maintained by Hashicorp. There are enterprise versions available such as Terraform Cloud AND Terraform Enterprise
    - Vendor Agnostic - Use with AWS, Azure, GCP, VMWare etc.
    - Terraform code? - Single Binary Compiled in Go
    - Declarative syntax
    - Configuration files written in HCL (Hashicorp Configuration Language) OR JSON. Preferred is HCL
    - Push style deployment
    - 4 Core components of Terraform
        - Executable
            - Single binary file we invoke to run terraform. Contains all TF functionality
        - Configuration file
            - 1..* configuration files with .tf extension
            - Terraform scans all files and stitches a configuration together based on contents
        - Provider plugins
            - Used by Terraform to talk to various cloud providers (AWS Providers, Azure etc.)
        - State Data
            - Stores information about resources provisioned. When we execute Terraform apply, terraform checks existing state file and compares the differences. Based on differences, it will either add, update or delete resources

    - Terraform Object Types
       - Providers
          - Provide details about the provider we want to use (AWS, Azure, GCP). Going to use AWS provider. Credentials and regions to use
       - Resources
          - Each resoure is associated with provider and we need to supply configurations to it. Could be EC2, VNet, DB etc.
       - Data sources
          - Information we might want to use in our configuration. Readonly resource. For ex - List of current available Availability zones, regions, AMI etc.
          
    - Terraform uses Block Syntax
```
block_type "label" "name_label" {
key = "value"
nested_block {
    key = "value"
    }
}
```

[Visualizing EC2 instance via Terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance)
```
resource "aws_instance" "web_server" {
name = "web_server"    # We see this name in AWs console
ebs_volume {
size = 40 
   }
}
```
    - Explanation
        - "aws_instance" - Type of resource that we are seeking to deploy
        - "web_server" - Name of this instance that can be referred in Terraform code
        - "name="web_server" - This is the name that would be present in AWS console
        - "ebs_volume" - This would be provisioned and attached to EC2 instance with size as 40 GiB
