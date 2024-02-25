# Provisioners
    - Defined as part of resource and are executed during resource creation or destruction
    - 1 resource can have multiple provisioners defined where each provisioner gets executed in the order in which they appear in configuration
    - Provisioner can run without resource as well. Use "null_resource" or "terraform_data" resource
    - If provisioner fails, we can tell terraform to either fail entire resource or continue on
    - Hashicorp considers provisioners a last resort when all other options have been considered and found lacking.
    - Provisioners are not creating objects with an API & a provider framework that TF can fully understand and manage. So, we need to take care of error checking, idempotency, consistency etc factors.
    - 3 types of provisioners:
        - File
            - Creates files and directories on a remote systme
        - Local-exec
            - Allows us to run script on local machine that is executing terraform run (For ex: Build agents)
            - Used as workaround for functionality that is not yet in the provider and is the most used often provisioner
        - Remote-exec
            - Allows us to run script on remote system
            - Most oftem, file and remote-exec can be replaced with startup script and passed through something like a user data


        - Example

```
provisioner "file"{
    connection{
        type = "ssh"
        user = "root"
        private_key = var.private_key
        host = self.public_ip
    }
    source = "path/to/file.txt"
    destination = "path/to/file.txt"
}
```

```
provisioner "local-exec"{
    command = "local command here"
}
```

```
provisioner "remote-exec"{
    scripts = ["list", "of", "scripts"]
}
    - TF recommends against use of providers. For our use,case we are going to use user-data for uploading file

```

