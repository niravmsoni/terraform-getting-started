# Tips to read documentation for provider

- All providers listed [here](https://registry.terraform.io/browse/providers)
- Deep-dive in AWS
    - Documentation [here](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
    - Searching for [aws_availability_zones](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones)
    - We see these 5 fields on the page
        - Description
            - Tells us brief information about what a resource does?
        - Example usage
            - Examples Below
        - Argument Reference
            - Configuration arguments that are supported. These values can be used inside aws_availability_zones block
            - For ex - all_availability_zones, filter state etc. (Refer below)
        - Attribute Reference
            - Data source exports following attributes
            - For ex - group_names, id, names, zone_ids etc.
            - Each attribute starts with the data type that it holds
        - Timeout
            - Any timeout associated with resource

```
# Declare the data source
data "aws_availability_zones" "available" {
  state = "available"
}

# e.g., Create subnets in the first two available availability zones

resource "aws_subnet" "primary" {
  availability_zone = data.aws_availability_zones.available.names[0]

  # ...
}

resource "aws_subnet" "secondary" {
  availability_zone = data.aws_availability_zones.available.names[1]

  # ...
}
```