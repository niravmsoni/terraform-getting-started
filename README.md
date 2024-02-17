# terraform-getting-started
Getting started with Terraform

IaC - Provisioning infrastructure through SW to achieve consistent, repeatable and predictable environments

### Core Concepts

#### All Infrastructure resources  - Defined in Code
#### Store infrastructure related code in a Source control (Git)
#### Declarative vs Imperative - 
##### Imperative 
     - If we want to create a Sandwich, if underlying language is imperative, we need to provide it with exact steps and assembling them together such as
     - Get ingredients
         - Get Bread
         - Get Vegetables
         - Get Potato
     - Assemble steps
        - Put vegetables within bread
        - Put potato in bread
        - Grill

#### Declarative 
    - If we want to create a Sandwich, if underlying language is declarative, the underlying person has knowledge about making sandwich and we do not need to provide with exact steps
    - We can just provide our configurations/ingredients we need in sandwich and then the code/person making sandwich should be able to figure out the steps to make a sandwich for us
    - If we use HCL as the language

     `
     food sandwich "make-sandwich"{
     ingredients = ["bread", "vegetables","potato"]
     }
     `
