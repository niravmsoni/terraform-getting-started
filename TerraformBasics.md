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
