# Deploy NGINX Management Suite, NGINX Plus and API Connectivity Manager in AWS (Debian 10)

## Requirements

- Laptop / Linux host / VM

- Internet connection

- AWS Credentials

- NGINX Plus Cert and Key
  https://www.nginx.com/free-trial-request/

- Ansible and Terraform Installed

## Pull the repo to your host

``` git pull https://github.com/F5-CSA-TEAM/nms-terraform-aws ```

## Configure AWS Credentials

Add your AWS Credentials below:

```
export AWS_ACCESS_KEY_ID=""
export AWS_SECRET_ACCESS_KEY=""
export AWS_SESSION_TOKEN=""
```

## Edit Terraform Variables File (vars.tf)

- Specify AWS Region

- EC2 Machine Type

- Security Group Name

### Deploy EC2 instances in AWS Using Terraform
``` 
terraform init;

terraform plan;

terraform apply;
```

This will create an Ansible inventory file in ../ansible/inventory/hosts.cfg

### Copy Created Hosts File to your Ansible Inventory (usually /etc/ansible/hosts)

Note: For MacOS you may need to create /etc/ansible/hosts

```
cp ../ansible/inventory/hosts.cfg /etc/ansible/hosts
```

Ref: https://docs.ansible.com/ansible/latest/user_guide/intro_inventory.html

### Prepare Ansible 

- Set NGINX Management Suite password in keys.yml (nms_passwd)

- Ensure NGINX cert and Key are in the running directory 

### Deploy NGINX Management Suite (NMS) with API Connectivity Manager (ACM)

Note: use <b>--ssh-common-args='-o StrictHostKeyChecking=no'</b> to ignore SSH authenticity checking

```
ansible-playbook deploy-nms.yml --ssh-common-args='-o StrictHostKeyChecking=no'
```

### Deploy the NGINX Plus Data Plane

Note: use <b>--ssh-common-args='-o StrictHostKeyChecking=no'</b> to ignore SSH authenticity checking

```
ansible-playbook deploy-nginx-plus.yml --ssh-common-args='-o StrictHostKeyChecking=no'
```

### Deploy NGINX Plus Developer Portal Instance

Note: use <b>--ssh-common-args='-o StrictHostKeyChecking=no'</b> to ignore SSH authenticity checking

```
ansible-playbook deploy-dev-portal.yml --ssh-common-args='-o StrictHostKeyChecking=no'
```

### Access and License NGINX Management Suite 

Access the NMS Login page at https://{NMS-IP}
