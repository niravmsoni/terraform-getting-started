# Validate and update configuration
    - TF has 2 commands to do this
        - fmt
        - validate
    - terraform fmt
        - Short for format
        - Format code in working directory to  follow Hashicorp standard
        - Does not check validity
        - Command flags
            - check
                 - Check code and not alter file. 
                 - Return non-0 exit code if there are formatting issues. Use this with CI/CD pipeline to ensure code is properly formatted before it is accepted
            - recursive
                - Check & fix formatting of tf code in current wrking directory and any subdirectories
                - With module, this is especially helpful since we would not have to run fmt command against each module directory
    - terraform validate
        - Helps us make sure configuration is correct
        - Requires terraform init
        - Checks syntax and logic
        - Does not check current state
        - No guarantee of success