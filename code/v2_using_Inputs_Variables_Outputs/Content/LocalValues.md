# Local Values
    - Internal to the configurations
    - Values with multiple references
    - Data transformation
    - Key value pairs. Values could be any terraform supported data types
    - We can specify locals multiple times within configuration. Condition is that each key must be unique within configuration
- Syntax

```
locals{
    key = value
}
```

- How to refer value?
    - local.<key> - IMPORTANT - It is local and not locals

```
locals{
    instance_prefix = "nirav"
    common_tags = {
        company = "Nirav Tech Soln"
        project = var.project
        billing_code = var.billing_code
    }
}

local.instance_prefix
local.common_tags.company
```