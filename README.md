# Ion Property Default Template Module for Terraform
Build a new Akamai Ion Standard Property with the same template as the Property Manager Ion Standard default. 

Ion Standard property template Terraform module which supports:
* Parameterized default CP code
* Parameterized default origin hostname (NetStorage or Customer origin supported)

## Example Usage
See the following tfvars files for the actual values to be applied depending on what type of origin is required:
* **example_customer_origin.tfvars**: set up property with NetStorage origin
* **example_netstorage_origin.tfvars**: set up property with Customer origin. The origin will use default setting (forward SSL, ports, compression support, client IP header, etc)

Call the `property-ion` module within your TF code:

```
module "property-ion" {
  source  = "jaescalo/property-ion/akamai"
  version = "1.3.0"

  edgerc_location    = var.edgerc_location
  edgerc_section     = var.edger_section
  group_name         = var.group_name
  edge_hostname      = var.edge_hostname
  property_name      = var.domain
  property_hostnames  = var.hostnames 
  cp_code_name       = var.cp_code_name
  origin_parameters  = var.origin_parameters
  version_notes       = var.version_notes
  emails              = var.emails
}
```

And pass the tfvars during the plan/apply:

`terraform apply -var-file=example_customer_origin.tfvars`

## Outputs
The outputs can be used for other modules. For example to create the certificates for "Secure by Default" the contract ID, group ID and Property ID are required.