FROM python:3.8-slim

# Install Terraform and Ansible
RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository --yes --update ppa:ansible/ansible && \
    apt-get install -y ansible unzip curl

# Install Terraform
RUN curl -O https://releases.hashicorp.com/terraform/0.12.29/terraform_0.12.29_linux_amd64.zip && \
    unzip terraform_0.12.29_linux_amd64.zip && \
    mv terraform /usr/local/bin/

WORKDIR /app

COPY . .

ENTRYPOINT ["/app/docker/entrypoint.sh"]
