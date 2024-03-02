# Functions and Loopings in TF

- Potential improvements
    - Dynamically increase instance
    - Decouple startup script and store them in template for possible updates/reuse - Refer [commit](https://github.com/niravmsoni/terraform-getting-started/commit/99d03aa427a2fa996b8a52aed447ea43fbb7e504) 
    - Simplify networking input. Specify VPC CIDR range and let terraform split it up among subnets - Refer [commit](https://github.com/niravmsoni/terraform-getting-started/commit/6ca230c19da5591af64f17ca04ee035d31808458)
    - Add consistent naming prefix to improve naming convention
