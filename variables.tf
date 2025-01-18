variable "repository" {
  type        = string
  description = <<DESCRIPTION
The name of the GitHub repository where the Azure Function Core environment configurations will be managed.

This repository will store the Terraform configuration files and GitHub Actions workflows necessary for provisioning and managing the Azure infrastructure.
DESCRIPTION
}
variable "branch" {
  type        = string
  description = <<DESCRIPTION
The branch of the GitHub repository where the configuration files will be committed.

Ensure that the specified branch exists in the repository and that the commit user has the necessary permissions to push changes to it.
DESCRIPTION
}
variable "path" {
  type        = string
  default     = "src/terraform"
  description = <<DESCRIPTION
The file system path within the repository where the Terraform configuration files and workflows will be stored.

This path determines the directory structure in the repository, organizing configuration files for better manageability.
DESCRIPTION
}
variable "commit_user" {
  type = object({
    name  = string
    email = string
  })
  description = <<DESCRIPTION
The GitHub identity used to commit the workflow YAML file to the repository.

This includes:
- **name**: The name of the user committing the workflow file.
- **email**: The email address of the user committing the workflow file.

Ensure that the provided Git identity has the necessary permissions to push changes to the specified repository and branch.
DESCRIPTION
}
variable "primary_location" {
  type        = string
  description = <<DESCRIPTION
The primary Azure region where the resources will be deployed.

**Examples**: `eastus`, `westeurope`, `southeastasia`

Selecting an appropriate primary location is crucial for optimizing latency, compliance, and availability of your Azure resources.
DESCRIPTION
}
variable "os_type" {
  type        = string
  description = <<DESCRIPTION
The operating system type for the Azure App Service Plan.

**Valid Values**:
- `Windows`
- `Linux`

This setting determines the underlying OS for the App Service Plan, affecting compatibility with certain Azure services and runtime environments.
DESCRIPTION
}
variable "sku_name" {
  type        = string
  description = <<DESCRIPTION
The SKU name for the Azure App Service Plan, defining the pricing tier and available features.

**Examples**: `Y1` (Consumption Plan), `EP1` (Premium Plan)

Choose a SKU that aligns with your performance requirements and budget. Refer to the [Azure App Service Pricing](https://azure.microsoft.com/en-us/pricing/details/app-service/) for detailed information on available SKUs.
DESCRIPTION
}
variable "retention_in_days" {
  type        = number
  description = <<DESCRIPTION
The number of days to retain logs and monitoring data in the Log Analytics Workspace.

**Default**: `30`

Setting an appropriate retention period helps in managing storage costs and ensuring compliance with data retention policies.
DESCRIPTION
}
