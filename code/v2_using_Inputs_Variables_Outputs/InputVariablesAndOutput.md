# Working with data
- 3 different concepts
    - Input variables/Variables
        - Used to pass information to teraform at runtime
        - When we are generating execution plan,  variables are defined in configuration & values are supplied when terraform is executed

    - Local Values/Locals
        - Computed values inside configuration that can be referenced throughout config
        - Similar to variables in other programming languages
        - Values of Locals are not submitted directly from external inputs but can be computed based on input variables and internal references

    - Output values
        - Outputs are defined in configuration and value of each output depends on what it references within configuration
        - Output can be constructed from more than 1 element

# Input Variable

Syntax

```
variable "name_label"{}
```
- All properties of Variable can be defined within the block. They are optional. However, recommended practice is to have properties
- Common arguments 
    - type - value - Data type of variable. Ex - number, string etc.
    - description - string - Helps with understanding purpose behind input variable
    - default - value - Set a default value. All input variables need to have value submitted at runtime. In-case if we want to have a default values associated with a variable, it can be set in this block. 
    - sensitive - true | false - If set to true, terraform will not show value of variable in logging/terminal output. Useful for submitting password/API key

- Examples

```
variable "billing_tag"{}

variable "aws_region" {
    type = string
    description = "Region to use for AWS resources"
    default = "us-east-1"
    sensitive = false
}
```

- How to refer value?
    - Using var.<name_label>
    - For referencing variable namely "aws_region" (Created above), use "var.aws_region"