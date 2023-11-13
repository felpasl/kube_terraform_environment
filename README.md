# Kubernetes Terraform Environment Setup

This repo has a sample code to create and version a basic infrastructure for a Kubernetes environment.

- [Apache ApiSix®](https://apisix.apache.org/docs/ingress-controller/design/) - Ingress Controller
- [Apache Kafka®](https://kafka.apache.org/) - Event streaming    
- [Kafka UI](https://docs.kafka-ui.provectus.io/overview/readme) - web UI for managing Apache Kafka®
- Kubed - Configuration (configmaps and secrets) Sync between namespaces
- MSSQL - opitional database

## Use Terraform Workspaces to manage more than one environment in same Cluster

https://developer.hashicorp.com/terraform/language/state/workspaces


## Useful Commands

### Pre-condition
terraform will perform actions against kubernetes using current context
`kubectl config use-context <context-name>`

### Commands
`terraform init` - initialize terraform modules

`terraform workspace new <name>` - create workspace

`terraform workspace select <name>` - select or change workspaces

`terraform apply` - apply changes on server.

## Run in Pipeline

`pipeline.variables.tfvars` sample:
```
kubed_enabled = "$(KUBED_ENABLED)"
apisix_enabled = "$(APISIX_ENABLED)"
kafka_ui_enabled = "$(KAFKA_UI_ENABLED)"
sa_password = "$(SA_PASSWORD)"
```

`terraform workspace select <name>`

`terraform plan -var-file pipeline.variables.tfvars  -out out.file` - create a Change Plan to Approval, This File can be used as input to the "apply" command.
Use a `pipeline.variables.tfvars` file as input variables

`terraform apply --set out.file` - apply changes



