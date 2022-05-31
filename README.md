# Digital Ocean Kubernetes Cluster IaC

Terraform module for deploying a kubernetes cluster to Digital Ocean.

## Pre-requisites

* You must have [Terraform](https://www.terraform.io/) installed on your computer. 
* You must have an DigitalOcean account.
* You must have a personal access token.

## Usage

**Please note that this module will deploy real resources into your account, and we are not responsible for any
charges you may incur.** 

Configure your [Digital Ocean Token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) as an 
environment variable:

```bash
export DIGITALOCEAN_TOKEN=(your access token)
```

Go into the example's folder:

```bash
cd examples/minimal
```

View the plan:
```bash
terraform init
terraform plan
```

Deploy the code:
```bash
terraform apply
```

Clean up when you're done:

```bash
terraform destroy
```

## Providers

This module uses these providers:

- digital_ocean

## Resources

This Terraform module creates:

- a Digital Ocean project to hold resources
- a docker registry
- a VPC for the cluster nodes
- a kubernetes cluster
- optionally creates an additional node pool within the same cluster

## Inputs

| Name                        | Description                                                                                | Type   | Default              | Required |
|-----------------------------|--------------------------------------------------------------------------------------------|--------|----------------------|----------|
| project_name                | Name of the project, this name will be added to the names of all of the resources created. | bool   | N/A                  | yes      |
| environment                 | Environment name that will be added to the name of all of the resources created.           | string | N/A                  | yes      |
| region                      | Region to use for the cluster.                                                             | string | nyc3                 | no       |
| default_pool_size           | Number of nodes to create in default node pool.                                            | number | 2                    | no       |
| default_pool_worker_type    | Type of the droplets to use for the default node pool.                                     | string | s-1vcpu-2gb          | no       |
| enable_additional_pool      | Enable or disable creation of additional node pool.                                        | bool   | false                | no       |
| additional_nodepool_size    | Number of nodes to create in the additional node pool.                                     | number | 1                    | no       |
| additional_pool_worker_type | Type of the droplets to use for the additional node pool.                                  | string | s-1vcpu-2gb          | no       |

## Outputs

| Name                                 | Description                                              |
|--------------------------------------|----------------------------------------------------------|
| registry_endpoint                    | Endpoint of the container registry created.              |
| kubernetes_cluster_id                | Id of the cluster created.                               |
| kubernetes_default_node_pool_name    | Name of the default node pool of the cluster created.    |
| kubernetes_additional_node_pool_name | Name of the additional node pool of the cluster created. |
