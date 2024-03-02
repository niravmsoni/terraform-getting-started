# Moving objects within state
- When we migrated to using VPC from Modules within terraform, despite our subnet ranges were same, within output of TF Plan, it showed, TF would delete and recreate it
- This is expensive since recreation of resource could result in a lot of potential impacts on the application

- Moving resources 
    - Option#1 -> use terraform state mv command
        - Use this after updating configuration and before running terraform plan
        - This will move subnet entry to new identifier address
        - terraform state mv OLD_ADDR NEW_ADDR
        - terraform state mv aws_subnet.public_subnets[0] module.app.aws_subnet.public[0]
        - Only option prior to TF 1.1

    - Option#2 -> Use Moved block (Recommended)
        - Example below
        - Add block to configuration after changing it and before running tf plan
        - Then execute apply
```moved{
    from = aws_subnet.public_subnets[0]
    to = module.app.aws_subnet.public[0]
}
```