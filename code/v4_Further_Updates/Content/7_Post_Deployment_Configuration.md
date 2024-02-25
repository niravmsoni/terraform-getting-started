# Post Deployment Configurations
    - After resource is created, sometimes, we need to perform some post deployment configurations
    - Example
        - Loading application to VM
        - Configuring DB cluster
        - Generating files on NFS share

    - There are a lot of providers and resourcse from terraform that can help us achieve this
        - Create file - Local file resource
        - Configure MySQL Db Cluster - MySQL Provider
        - K8 cluster - Helm and K8 provider

    - Another option - Pass startup data to servers
        - All major cloud providers offer way to pass data to server. However, the name changes
        - For AWS - We do use "user_data" argument
        - Cons of passing script is TF has no way to track if intent of script is successful or not
        - As long as it exits with code of 0, TF is happy since TF doesnt know desired state of machine, it will recreate machine if we change startup script even if current instance won't be affected by it
        - This is bad
        - For better management of OS & configuration, we should go outside of TF and use config managers (Chef, Puppet, Ansible etc,)
        - Last option - Terraform Provisioners
    