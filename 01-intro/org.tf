# main.tf

provider "aws" {
  region = "us-east-1" # or your preferred region
}

# Create AWS organization
resource "aws_organizations_organization" "napier_park_org" {
  feature_set = "ALL"
}

# Create production account
resource "aws_organizations_account" "prod_account" {
  name      = "Napier Park Prod"
  email     = "prod@example.com"
  parent_id = aws_organizations_organization.napier_park_org.id
}

# Create DR account
resource "aws_organizations_account" "dr_account" {
  name      = "Napier Park DR"
  email     = "dr@example.com"
  parent_id = aws_organizations_organization.napier_park_org.id
}

# Set up organization policy for both prod and dr accounts
resource "aws_organizations_policy" "napier_park_policy" {
  content = <<-EOF
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Action": "*",
        "Resource": "*"
      }
    ]
  }
  EOF

  description = "Organization-wide policy for Napier Park"
  name        = "NapierParkOrgPolicy"
  type        = "SERVICE_CONTROL_POLICY"
}

# Attach policy to the organization root
resource "aws_organizations_policy_attachment" "napier_park_policy_attachment" {
  policy_id = aws_organizations_policy.napier_park_policy.id
  target_id = aws_organizations_organization.napier_park_org.id
}
