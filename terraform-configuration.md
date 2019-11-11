# HCL (Hashicorp Configuration Language)
- key-value syntax

# Types of configuration
- Resources = infrastructure components managed by terraform
- Providers = provide resource
- Variables
- Outputs
- Data Sources = fetch data from outside config

# Interpolation
##variables
${var.name}
e.g. 
variable "image_id" {
  default = "debian-cloud/debian-8"
}
ami = var.image_id

## map key value
${var.name["key"]}

## list index value
${var.name[index]}

## resource attributes
$var.name.attributes

## data sources
${data.type.name.attributes}

# conditionals
${condition ? true_expression : false_expression}  
e.g machine_type = ${var.env == "production" ? "n1-highmem-64" : "n1-standard-1"}  
// if machine is production is hgh memory if not use standard
