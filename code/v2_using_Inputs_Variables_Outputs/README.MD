# What's changing in V2?
    - Keep architecture as-is
    - Improve code
        - Remove AWS credentials from code file
        - Replace hard-coded values
            - Variables - Examine main.tf file, identified hard-coded values & defined variables for them
            - Supply as Environment Variables - AWS Secret Key and Access Key are set in Environment variables so they would not be present in Source control
        - Add default Tags for company, project and billing
            - Tag details
                - Company - Default to "Nirav Corporation"
                - Project - "Company-project"-  No defaults
                - Billing Code tag - No defaults
            - Using Locals

        - Generate output for public DNS hostname
            - Using Outputs
        