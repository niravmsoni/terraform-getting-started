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

- How to Variable values?
    - 6 ways to do so
        - Default value
        - var flag
            - We can set multiple variable by specifying multiple -var in command line
        - var-file flag
            - All variable values defined in file and submit that file with this flag
            - Within file, it would be key-value pair for each variable
        - terraform.tfvars OR terraform.tfvars,json
            - If file exists in same directory with either of this names, terraform finds it automatically and uses it
        - .auto.tfvars or .auto.tfvars.json
            - Terraform finds this and uses them
        - Environment variables - TF_VAR_<NAME>
            - Look for any variable with TF_VAR_<NAME>
            - Capitalization matters

- If niether way set, terraform will prompt us at run-time to supply the value

- Precendence / Order of Evaluation
    - TF_VAR environment variable
    - terraform.tfvars or terraform.tfvars.json
    - .auto.tfvars or .auto.tfvars.json
    - var-file flag
    - var flag
    - Command line prompt

- Evaluation - Top to bottom. Last one set winning
- We can also override value (Similar to appsettings.json)
    - If we have defined a value in terraform.tfvars, and for testing purpose we want to override it, we can override value using either of options below (Terraform.tfvars in above list) - For ex - Command line