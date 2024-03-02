# Terraform Expressions and Functions
- Expressions
  - Interpolation (Using $) and Heredoc (Pass User Data to EC2)
  - Arithmetic and Logical Operators (AND, OR, EQUALS, GREATER THAN ETC.)
  - Conditional Expressions (If statement - True/False)
    - Combine this with count argument to conditionally create resource (Used for Lifecycle rules for Auditing Lifecycle in lower environment)
  - For Expressions
    - Used to manipulate and transform collections
    - Can take any type of collection (Object, list, set etc.) and return new typle or object

- Functions
  - Help us manipulate/transform data
  - Functions are built-in terraform binary
  - Syntax
    - Func_name(arg1, arg2, arg3,...)
  - Arguments are not named but they must be in proper order
  - For testing functions
    - terraform plan - We can use this to test functions but is timeconsumnig
    - terraform console - Used for evaluating functions and expressions. Better/More efficient