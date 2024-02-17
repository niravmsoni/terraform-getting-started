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
    - Idempotent - If we provision a VM, and next time, if we ask for the same VM, Terraform tells us we already have it created. It is Aware of the resource history (Using a state file). If we have not changed any configuration against a resource and if we again apply it against the same environment, nothing will change in environment because a resource with required configuration already exists 

### 5. Push or Pull
     - Push - Terraform follows a push model. Whatever configurations are requested by the user, terraform creates resource based on it. If it was pull based, there would be agents running on the cloud provider regularly polling for changes from IaC tools (Terraform, Pulumi etc.)


### Benefits of IaC
     - Reusability - Write code to provision infrastructure once and reuse it (For different environments)
     - Automated deployments - Integrate it with CI/CD pipeline and ensure resources are getting created automatically without manual intervention from portal
     - Repeatable and consistent - Everytime we need an update to a resource, we update the configuration and deploy. This will ensure resource is consistent on all environments (Dev, QA, Perf, Prod)
     - Documented architecture - We have our infrastructure architecture well documented 
