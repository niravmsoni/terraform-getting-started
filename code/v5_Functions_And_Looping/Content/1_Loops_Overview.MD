# Loops

- TF has several ways to create multiple instances of an object
- Looping constructs
    - Count
    - For_each

- Count
    - Meta-argument for modules and resources
    - Used to create multiple instances of a resource OR module when instances are identical in nature
    - Valid value for count argument = +ve integer or 0
        - 0 - Useful when we want to make creation of resource conditional (Used in setting up lifecycle policy for Audit)

- For_each
    - Meta-argument for modules and resources
    - Takes set or map as value & is used when we want to create multiple instances of a resource or Module where each instance will be significantly different than others
    - We have full access to values stored in set or map when configuring each instance

- Dynamic Blocks
    - Used to create multiple instances of a nested block inside a parent object
    - Take in map or set for a value to construct blocks

- Count Syntax
    - Goes inside resource block and accepts int as value
    - When count is used, a special new expression is available namely "count.index"
    - Index Starts with 0. When TF loops through this resource, TF resolves and gives us current iterating value as index
    - Example below
    
```
instances.tf

# Creates 3 EC2 instances
resource "aws_instance" "web_servers"{
    count = 3
    tags = {
        Name = "nirav-web-${count.index}"
    }
}

How to reference this?
<resource_type>.<name_label>[element].<attribute>
aws_instance.web_servers[0].name    # string - Returns name of first instance
aws_instance.web_servers[*].name    # list(string) - Returns names of all instances. Called as Splat index

```

- For_each Syntax
    - Value for For_each would be either set or map
        - Set = unordered collection of unique objects
    - For_each has 2 special expressions
        - each.key
        - each.value

    - Example below

```
s3.tf

# Terraform creates 2 S3 buckets
resource "aws_s3_object" "taco_toppings"{
    for_each = {
        cheese = "cheese.png"
        lettuce = "lettuce.png"
    }
    key = each.value
    source = "./${each.value}"
    tags = {
        Name = each.key
    }
}

How to reference it?
<resource_type>.<name_label>[key].<attribute>
aws_s3_object.taco_toppings["cheese"].id    # Returns Id for Single instance

```

- Looping Targets
    - What can we update in our configuration?
        - Primary Resources
            - aws_subnets 
                - Right now, there are 2 public subnets. Going forward this can change.
                - Only difference is CIDR Range and AZ
                - Can use Count loop
            - aws_instance
                - Multiple EC2 instances
                - Difference - Subnet
                - Can use Count loop
            - aws_s3_bucket_object
                - S3 bucket objects
                - Have different names and paths
                - Can use For_each here
        - Impacted resources (Due to above change)
            - aws_route_table_association
            - aws_lb_target_group_attachment
            

