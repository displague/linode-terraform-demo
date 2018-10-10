FROM hashicorp/terraform:full
ENV SOURCE_REPO https://github.com/displague/terraform-provider-linode.git/
RUN git clone $SOURCE_REPO $GOPATH/src/github.com/terraform-providers/terraform-provider-linode
RUN go install github.com/terraform-providers/terraform-provider-linode
RUN mkdir -p /terraform/config && \
    touch /terraform/config/main.tf && \
    echo -e "provider \"linode\" {}\nmodule \"app1\" { source = \"./config\" }" > /terraform/main.tf
WORKDIR /terraform/
RUN terraform init
