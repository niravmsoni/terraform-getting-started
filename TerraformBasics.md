### Terraform
Terraform
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

- [Visualizing EC2 instance via Terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance)
```
resource "aws_instance" "web_server" {
name = "webserver"    # We see this name in AWs console
ebs_volume {
size = 40 
   }
}
```

Explanation
    - "aws_instance" - Type of resource that we are seeking to deploy
    - "web_server" - Name of this instance that can be referred in Terraform code
    - "name="webserver" - This is the name that would be present in AWS console
    - "ebs_volume" - This would be provisioned and attached to EC2 instance with size as 40 GiB

- Terraform Object Reference
- <resource_type>.<name_label>.<attribute>
- For getting name of AWS EC2 instance that we just created above, use aws_instance.web_server.name - Using this we will get value of name property i.e. webserver
- Single line comments - Using #
- We can use the same name label for multiple resources (For ex. VPC, subnets, their route tables etc.)
- However, same name label cannot be used for same type of resources (For ex. 2 EC2 instances with same name label) - Terraform will throw error

Terraform Workflow
- terraform init
  - Looks for configuration files inside working directory and sees if it needs any provider plugins. If needed, it will download plugin data from public terraform registry (Unless we specify any other registry)
  - Store state file in specified backend (Local directory or Remote)
- terraform plan
  - Terraform examines current state file and the resources requested for deployment and identify the differences
  - It will tell us what actions will the terraform perform (x to add, y to change, z to delete)
  - This is Optional but generally recommended to check what changes terraform is going to make to our resources
  - Terraform generates an execution plan. We can save this in a file and feed it in the next step
  - Command - terraform plan -out <fileName>.tfPlan 
  - Do note - Extension is not mandatory. .tfPlan is generally considered as best-practice 
- terraform apply
  - Assuming we ran terraform plan and saved changes in a file, terraform simply executes those changes using provider plugins
  - Resources will be added/updated/deleted based on configuration and then state file will be updated
  - If we run terraform plan/apply without making any changes, terraform will tell us there are no changes detected since configuration and state data matches
  - Command - terraform apply "planName"
  - Do note - If we have out plan name in tfPlan file, we could supply the same file here in terraform apply. This way, it will simply execute whatever plan was captured in this plan file
  - If we do not specify plan name, terraform would internally execute terraform plan and then ask for approval (Yes/No) and then work on actual resource creation
- terraform destroy
  - If we are done with environment, we can execute this command
  - Terraform will destroy all resources present in state file. This is dangerous command. Should be used with caution
