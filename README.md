# Terraform script for spin up Compte engine nginx web server and Cloud sql

before run the script,
- install [Cloud SDK](https://cloud.google.com/sdk/docs/install-sdk)
- create [service account](https://cloud.google.com/iam/docs/creating-managing-service-accounts#iam-service-accounts-create-console) and download json [key file](https://cloud.google.com/iam/docs/creating-managing-service-account-keys) 
- give key file path to credentials in side provider block in main.tf

## Initialize Terraform
```sh
terraform init
```
## Validate the Terraform configuration
```sh
terraform plan
```
## Apply the configuration
```sh
terraform apply
```
## Clean up resources
```sh
terraform destroy
```

## Resources
 - [Google Cloud Platform Provider](https://registry.terraform.io/providers/hashicorp/google/latest/docs/guides/getting_started)
 - [Compute Engine](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance)
 - [Cloud SQL](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database_instance)
 - 
