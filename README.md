## Linode Terraform Provider in a Container

This repository contains a `Dockerfile` and a basic set of Terraform configuration files that demonstrate the Linode Terraform Provider.

The image is based on the `hashicorp/terraform:full` image, adding only the Linode provider.

Terraform variables can be defined in config files, using the command-line, or using environment variables.  For the purposes of this demo container, environment variables will be supplied through `docker -e` arguments.  We will also attach the local copy of this repository to the container.


```
read -sp "Linode Token: " LINODE_TOKEN
export TF_VAR_root_pass="$(openssl rand -base64 32)"
export TF_VAR_authorized_key="$(cat ~/.ssh/id_rsa.pub)"
export TF_VAR_linode_token="$LINODE_TOKEN"

alias dockertf=docker run  -v `pwd`/:/terraform -it -e TF_VAR_root_pass="$TF_VAR_root_pass" -e TF_VAR_authorized_key="$TF_VAR_authorized_key" -e TF_VAR_linode_token="$TF_VAR_linode_token"
dockertf plan
dockertf apply
```

You will notice that `.terraform` now contains more files.

```
dockertf destroy
```

To dive deeper into this demo,
```
docker run -it --entrypoint /bin/bash linode/terraform
```

