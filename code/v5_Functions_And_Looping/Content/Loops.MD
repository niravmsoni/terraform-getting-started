# Loops

- TF has several ways to create multiple instances of an object
- Looping constructs
    - Count
    - For_each

- Count
    - Meta-argument for modules and resources
    - Used to create multiple instances of a resource OR module when instances are identical in nature
    - Valid value for count argument = +ve integer or 0
        - 0 - Useful when we want to make creation of resource conditional (Used in setting up lifecycle policy for Audit)

- For_each
    - Meta-argument for modules and resources
    - Takes set or map as value & is used when we want to create multiple instances of a resource or Module where each instance will be significantly different than others
    - We have full access to values stored in set or map when configuring each instance

- Dynamic Blocks
    - Used to create multiple instances of a nested block inside a parent object
    - Take in map or set for a value to construct blocks
