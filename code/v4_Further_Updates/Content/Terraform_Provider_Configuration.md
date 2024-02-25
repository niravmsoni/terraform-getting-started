# Terraform Provider Block Syntax

    - Provider information is defined in terraform configuration block using nested block namely [required_providers](https://developer.hashicorp.com/terraform/language/providers/requirements)
    - This block is used to configure general settings about terraform configuration
        - Terraform version
        - Required back-end setting for state data
        - Required provider plugin
        - Provider metadata
        - Experimental language feature etc.

    - Terraform Block syntax
```
terraform.tf
===========
terraform
{
    required_version = "version_constraints"
    required_providers {
        provider_name = {
            source = "address_to_provider
            version = "version_constraints"
        }
    }
}
```
Example
```
terraform{
    required_version = ">= 1.0, < 2.0"
    required_providers{
        aws = {
            source = "hashicorp/aws"
            # =, <, >, and ~>
            version = "~>4.0"
        }
    }
}
```

Explanation
    - Required_version
        - We are specifying terraform version to be > 1 and < 2
        - This is to ensure we have upper limit specified so that we do not have breaking changes
    - Required_providers
        - We would set key to AWS
        - For source, we can use shorthand "hashicorp/aws"
        - For version, with current configuration, we have told that we need to be on major version 4 of plugin and we do not care about minor version
        - This is shorthand syntax that instructs terraform to find latest plugin with form 4.x


    - When we do terraform init, terraform writes out version constraint and specific version of provider to dependency lock file called .terraform.lock.hcl in current working directory
    - Unless we tell terraform to use newer version of provider, it will use version specified in lock file
    
    - Observation
        - So, far, we never specified version of Provider(aws) or terraform
        - So, how did it take the version till now?
            - Reason 
                - Terraform tries to make things easier for us. 
                - If we have specified provider block (In our case - provider "aws") OR the first item in data block, it finds the matching plugin from public terraform registry and downloads it
                - If it can't find matching provider, it will throw error
                - This is good for starting out but it is ideally recommended to have required providers block so we can explicitly control version and source of provider

    - Once we have defined provider, we can reference it in the provider block

```
provider "provider_name"{
    alias = "alias_name"    # Useful in case if more than 1 instance of a provider is to be created
    # Provider specific arguments
}
```

Using AWS as Provider
```
provider "aws"{
    alias = "west"  # Giving Alias indicating all resources to be in west region
    # Provider specific arguments
}

# EC2 instance
resource "aws_instance" "web_server"{
    provider = aws.west # Using Alias here
}
```

Explanation
    - In above example, web_server will be created with provider configuration aws.west
    - In case if no alias is defined, terraform will default to provider instance with no alias set