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