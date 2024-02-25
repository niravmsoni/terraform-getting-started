# Planning and dependencies
    - Before applying configurations, terraform has to go through planning process
    - This happens when we generate execution plan
    - It figures our order in which create, update or delete happens

    - How plan works?
        - Terraform loads state data in memory and refresh atributes of resources and data from target env
        - Parse configuration and builds dependency graph
        - Comparing graph and state data, terraform makes list of adds, update and deletes
        - Terraform tries to make updates in parallel to it tries to figure out which changes are dependent on other changes
        - Independent changes can be made at same time (Executed parallely) whereas changes that are dependent would be done in serial fashion
        - How does terraform figure that out?
            - By References

    - Example
        - In our code, we do create VPC, subnet and EC2 instance
        - aws_vpc 
            - VPC does not refer to any other resource in configuration so TF can create it immediately
        - aws_subnet 
            - Under aws_subnet, we see reference of aws_vpc.vpc.id 
            - We have a reference to VPC Id. The Id of VPC is not known until VPC is created. So, reference creates dependency on ID attribute of VPC
            - TF will wait until VPC is created and then use ID to create subnet
        - aws_instance
            - This has reference to aws_subnet.public_subnet1.id
            - Since subnet Id is also unknown before creation, So, TF will wait for creating this resource until subnet is provisioned
    
    - Thus, terraform infers or knows about this dependency on its own. We do not need to tell terraform explicitly about it
    - But sometimes, dependency is non-obvious and we need to instruct terraform explicitly about it. 
    - Refer below usecase
        - aws_iam_instance_profile and _aws_iam_role_policy have a reference of aws_iam_role
        - For EC2 instance to access S3 bucket, it has a reference of aws_iam_instance_profile
        - However, for it to be able to successfuly access S3 bucket, it also needs to wait till aws_iam_role is created
        - This is where we need to explicitly add "depends_on"
