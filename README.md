## Linode Terraform Provider in a Container

This repository contains a `Dockerfile` and a basic set of Terraform configuration files that demonstrate the Linode Terraform Provider.

The image is based on the `hashicorp/terraform:full` image, adding only the Linode provider.

Terraform variables can be defined in config files, using the command-line, or using environment variables.  For the purposes of this demo container, environment variables will be supplied through `docker -e` arguments.  We will also attach the local copy of this repository to the container.

### Name the Container

```bash
DOCKER_IMAGE=displague/linode-terraform-demo
```

### Build the Container (Optional)

```bash
docker build . -t $DOCKER_IMAGE
```

### Setup the Environment for the Container

```bash
read -sp "Linode Token: " LINODE_TOKEN; echo
export TF_VAR_root_pass="$(openssl rand -base64 32)"
export TF_VAR_authorized_key="$(cat ~/.ssh/id_rsa.pub)"
export TF_VAR_linode_token="$LINODE_TOKEN"
```

### Run the Container

Finally, let's run terraform from the container.

```bash
alias dockertf='docker run  -v `pwd`/:/terraform -it -e TF_VAR_root_pass="$TF_VAR_root_pass" -e TF_VAR_authorized_key="$TF_VAR_authorized_key" -e TF_VAR_linode_token="$TF_VAR_linode_token" $DOCKER_IMAGE'
dockertf plan
dockertf apply
```

You will notice that `.terraform` now contains more files.

#### Destroy the created Linode Instances


```bash
dockertf destroy
```

### Enter the Container

To dive deeper into this demo,

```bash
docker run -it --entrypoint /bin/bash displague/linode-terraform-demo
```

