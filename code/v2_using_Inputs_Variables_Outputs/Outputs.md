# Outputs
    - Get information out from terraform
    - Printed in terminal window at end of configuration run
    - Terraform also stores output values in state data and used to expose values when configuration is placed inside module
    - Output can return any terraform supported data type
- Syntax

```
output "name_label"{
    value = value #Required
    description = "string" #Optional
    sensitive = true | false
}
```

- Example

```
output "public_dns_hostname"{
    value = aws_instance.web_server.public_dns
    description = "Public DNS hostname of web server"
}
```