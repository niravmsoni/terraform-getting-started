# Terraform State
- Contents
    - Resources, data sources and outputs
    - State data is stored in JSON format. Do not touch!
    - Stores important information about deployment including mapping object address to unique ID in target identifier
    - Also stores version of terraform used, version of state data format and serial number of current state data

- Upon Terraform plan
    - Terraform loads existing state data in memory & refreshes values by querying deployment environment
    - Performs difference between configuration and state data

- Locking
    - When TF executes operation that alters state data, it tries to place lock on state data so no other instance of terraform can update it
    - Provides conflicts

- Where to store state data?
    - Local (By-default)
    - Remote (AWS S3/Azure Blob storage/NFS Share/Terraform cloud etc.)
        - Useful in collaborative environment (Corporate teams to provision their infra) and also move state data off local machine for safety sake

- Commonly used State commands
    - terraform state list
        - List all resources managed by terraform
    - terraform state show ADDRESS
        - Show specific resource. If we want to know more about a resource type. - Supply "resourceType.<name_label>"
    - terraform state mv SOURCE DESTINATION
        - Move item in state
            - Useful when we want to rename a resource or Move them to modules
    - terraform state rm ADDRESS
        - Remove resource from terraform without actually destroying it
        - Remove resource from configuration and then remove state
    
- GOLDEN RULE - Make ALL CHANGES WITH TERRAFORM - Do not touch managed resources with cloud console or CLI. Make sure changes go through only via Terraform