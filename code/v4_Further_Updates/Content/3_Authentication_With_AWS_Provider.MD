# Authentication with AWS Provider

    - Up until now, we were using Input variables for specifying 
        - AWS Access Key
        - AWS Secret Key
        - Cons with this approach,
            - Because we are using input variables, someone can accidentally put those credentials in variables.tfVars file and check it in the source control which could result in sensitive information getting leaked to outside world
    - And then, we were using Environment variable to set these values
    - Environment variable is the most common approach
    - Better approach
        - Define credentials using 2 environment variable (Fixed)
            - AWS_ACCESS_KEY_ID
            - AWS_SECRET_ACCESS_KEY
        - 