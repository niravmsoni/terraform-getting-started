# terraform-getting-started
Getting started with Terraform

IaC - Provisioning infrastructure through SW to achieve consistent, repeatable and predictable environments

### Core Concepts

#### 1. All Infrastructure resources  - Defined in Code
#### 2. Store infrastructure related code in a Source control (Git)
#### 3. Declarative vs Imperative - 
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
    -  Terraform is DECLARATIVE in nature 
### 4. Idempotent and consistent
    - Consistency - Everytime we do something, the result should be same
    - Idempotent - If we provision a VM, and next time, if we ask for the same VM, Terraform tells us we already have it created. It is Aware of the resource history (Using a state file).
