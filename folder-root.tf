locals {
  root_folder_files = [
    "gallery.tf",
    "main.tf",
    "variables.tf",
    "versions.tf"
  ]
}

resource "github_repository_file" "root_folder" {

  for_each = toset(local.root_folder_files)

  repository          = var.repository
  branch              = var.branch
  file                = "${var.path}/${each.key}"
  content             = file("${path.module}/files/${each.key}.t4")
  commit_message      = "Managed by Terraform"
  commit_author       = var.commit_user.name
  commit_email        = var.commit_user.email
  overwrite_on_create = true

}

resource "github_repository_file" "terraform_tfvars" {

  repository = var.repository
  branch     = var.branch
  file       = "${var.path}/terraform.tfvars"
  content = templatefile("${path.module}/files/terraform.tfvars.t4",
    {
      location = var.location
    }
  )
  commit_message      = "Managed by Terraform"
  commit_author       = var.commit_user.name
  commit_email        = var.commit_user.email
  overwrite_on_create = true

}
