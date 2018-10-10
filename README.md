
```
docker run  -v `pwd`/:/terraform -it linode/terraform -var root_pass="$(openssl rand -base64 32)" -var authorized_key="$(cat ~/.ssh/id_rsa.pub)" -var linode_token="$LINODE_TOKEN"
```

```
docker run -it --entrypoint /bin/bash linode/terraform
```

