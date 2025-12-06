module "payroll_app" {
  source     = "/root/terraform-projects/modules/payroll-app"
  app_region = lookup(var.region, terraform.workspace)
  ami        = lookup(var.ami, terraform.workspace)
}

# terraform workspace select 'workspace_name' -> terraform apply (variables will vary depending on the value of the current workspace)