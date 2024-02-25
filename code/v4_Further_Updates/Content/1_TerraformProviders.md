# Terraform Providers

    - Terraform Provider plugins are available in public registry [here](https://registry.terraform.io/)
    - This is one of the registry. We can get plugins from other public registries, privately hosted registry or even our local file system
    - 3 tiers of provider tiers available:
        - Official
            - Maintained by Hashicorp. If we run into issues, we get support from Hashicorp crew
        - Partner
            - Maintained by 3rd party org that has direct relation with Hashicorp. We can expect decent level of support from these providers
        - Community
            - Written and maintained by individuals in community.

    - All providers on registry are open source and written in Go
    - Providers
        - Collection of data sources and resources
        - Versioned
            - They have major, minor and patch number separated by dots
            - (major).(minor).(patch)
            - Major
                - Grander in scope and does include breaking changes from previous version
            - Minor
                - Introduce new features and should not have breaking changes
            - Patch
                - Contains bug fixes
        - We can tie our code with a versionin our provider plugin so that we ensure in case if provider updates major version, because we are tied to a version, it does not break anything in our deployment
        - Multiple instances
            - Alias argument - We can have multiple instances of a provider within our configuration and refer each instance with an alias
            - Usecase - Wjy we need more than 1 instance of provider?
                - Instance of AWS provider is limited to a region. If we want to use more than 1 region in configuration, we could do so with multiple instances each with unique alias