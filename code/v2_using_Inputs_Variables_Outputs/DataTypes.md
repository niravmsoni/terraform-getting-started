# Terraform Data Types
- We can group data types into 3 different categories
    - Primitive
        - String, number, bool
    - Collection - Represents Grouping of data types
        - List, set, map
    - Structural - Similar to collection except they allow us to mix data types stored in each grouping
        - Tuple, object
    - Any
        - Used to signal terraform "We do not know what data type is going to be stored"?
        - Example - list(any) - Could be list of strings/int/lists etc.
    - Null
        - Not useful as such. Most commonly used to set default value for input variable

- List
    - All data types within list to be same
    - Example
        - [1,2,3,4]
        - ["us-east-1","us-east-2"]
        - ["us-east-1",1] - Wrong for List but works for Tuple

- Map
    - Created with curly braces. Key value pairs. 
    - All keys must be unique. Values must be of same data type
    - Example
```
{
    small = "t2.micro"
    medium = "t2.small"
    large = "t2.large"
}
```

- Referencing collection values
    - var.<name_label>[<element_number>]
- List Example
```
# Defining variable
variable "aws_regions"{
    type = list(string)
    description = "Regions allowed to be used for AWS resources"
    default = ["us-east-1","us-east-2","us-west-1]
}

var.aws_regions[0] - Gives us "us-east-1"
var.aws_regions - Gives us the whole list
```

- Map example
    - var.<name_label>.<key_name> OR var.<name_label>["key_name"]
```
variable "aws_instance_sizes"{
    type = map(string)
    description = "Instances sizes to use for EC2"
    default = {
        small = "t3.micro"
        medium = "m4.large"
        large = "m4.xlarge"
    }
}

var.aws_instance_sizes.small OR var.aws_instance_sizes["small"]
```