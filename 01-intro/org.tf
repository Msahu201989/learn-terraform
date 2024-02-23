# main.tf

provider "aws" {
  region = "us-east-1"
}

# Create AWS organization
resource "aws_organizations_organization" "main" {
  feature_set = "ALL"
}

# Create Organizational Units (OUs)
resource "aws_organizations_organizational_unit" "ou1" {
  name       = "OU1"
  parent_id  = aws_organizations_organization.main.id
}

# Create AWS Accounts
resource "aws_organizations_account" "account1" {
  name      = "Account1"
  email     = "account1@example.com"
  role_name = "OrganizationAccountAccessRole"
  parent_id = aws_organizations_organizational_unit.ou1.id
}

# Create more accounts and OUs as needed...
