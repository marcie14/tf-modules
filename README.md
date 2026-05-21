# tf-modules

Reusable Terraform modules — the building blocks used by `tf-deployments`. Think of this as your internal module registry. Each module is self-contained, versioned via git tags, and has no knowledge of which environment it's being deployed into.

**You do not run `terraform apply` here directly.** Modules are only ever called by other repos.

---

## What Lives Here

### `modules/vpc/`
Creates an AWS VPC with public and private subnets across multiple availability zones. Used as the network foundation for ECS and RDS.

### `modules/ecs-service/`
Deploys a containerized application on ECS Fargate with an Application Load Balancer. Takes a Docker image URI as input — no app code needed. Used to deploy the practice web app.

### `modules/rds/` _(optional)_
Deploys a Postgres RDS instance inside the VPC's private subnets. Useful for practicing database connectivity from ECS.

### `modules/gke-cluster/`
Creates a GKE cluster on GCP. Used to practice Kubernetes — deploying the same containerized app that runs on ECS, but on Google's managed Kubernetes platform.

---

## Versioning

Modules are referenced by git tag in `tf-deployments`:

```hcl
module "vpc" {
  source = "github.com/marcie14/tf-modules//modules/vpc?ref=vpc-v1.0.0"
}
```

This means changes to a module don't automatically affect deployments — you have to explicitly bump the tag reference. This is how real module registries work (including the Terraform public registry).

**Tagging convention:** `<module-name>-v<major>.<minor>.<patch>`
- Example: `vpc-v1.0.0`, `ecs-service-v1.2.0`

---

## Structure

```
tf-modules/
└── modules/
    ├── vpc/
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    ├── ecs-service/
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    ├── rds/
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    └── gke-cluster/
        ├── main.tf
        ├── variables.tf
        └── outputs.tf
```

---

## Design Principles

- Modules accept inputs via `variables.tf` and expose outputs via `outputs.tf` — no hardcoded environment-specific values
- Each module does one thing well
- Modules are tested by deploying them through `tf-deployments` in the dev environment first
