# Module Syntax
- Example Module

```
module "name_label"{
    source  = "local_or_Remote_source"
    version = "version_expression"
    providers = {
        module_provider = parent_provider
    }
}

# Input variables values
```

- Explanation
    - Module keyword along with name label. Name label has to be descriptive of intention behind module
    - Rest configuration goes inside block
    - source - Source can be local or remote
    - version - If source supports versioning, we can specify it in version argument
    - providers - If we want to use specific instance of provider in module, we can do so with this argument. Value is map where key is name of provider in child module and value is name of provider alias expression in parent module. If we do not specify providers block, TF uses default provider instance that matches provider type in child module
    - Remainder - Key value pairs
    - Does support depends_on argument

```
main.tf - Parent
module "tacos"{
    source = "./modules/s3"
    # Pass bucket_name as input variable to this module
    bucket_name = "taco_bucket"
}

locals {
    # Consume output variable exposed by Module
    taco_id = module.tacos.bucket_id
}

modules/s3/main.tf - Child Module

variable "bucket_name" {}

resource "aws_s3_bucket" "main"{
    name = var.bucket_name
}

output "bucket_id"{
    value = aws_s3_bucket.bucket.id
}
```
