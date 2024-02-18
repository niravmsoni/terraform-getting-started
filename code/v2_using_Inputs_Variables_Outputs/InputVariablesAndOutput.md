# Working with data
- 3 different concepts
    - Input variables/Variables
        - Used to pass information to teraform at runtime
        - When we are generating execution plan,  variables are defined in configuration & values are supplied when terraform is executed

    - Local Values/Locals
        - Computed values inside configuration that can be referenced throughout config
        - Similar to variables in other programming languages
        - Values of Locals are not submitted directly from external inputs but can be computed based on input variables and internal references

    - Output values
        - Outputs are defined in configuration and value of each output depends on what it references within configuration
        - Output can be constructed from more than 1 element

