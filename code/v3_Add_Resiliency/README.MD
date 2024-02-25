# What's changing in V3?
    - Current Architecture - Not resilient
        - Add another EC2 in a separate AZ
        - Put both EC2 instances behind load balancers
        - Enhance code readability
            - Put resources in separate files such as networking, instances, load balancers etc.

- Updated Architecture

![File](https://github.com/niravmsoni/terraform-getting-started/assets/6556021/9b7e696b-639a-4be0-888c-5492b3f9b2c6)

- Output

    - Requests now get served by 2 instances sitting behind load balancer

![Instance 1](https://github.com/niravmsoni/terraform-getting-started/assets/6556021/900cb988-7ab4-480d-b8bb-b1f4001e7c2d)
![Instance 2](https://github.com/niravmsoni/terraform-getting-started/assets/6556021/58c95779-94ef-4b62-8ca4-2d5559f738e9)
