# -------------------------------------------------
# Common Variables 
# -------------------------------------------------

variable "group_name" {
  description = "Akamai Group Name"
  type        = string
}

variable "product_id" {
  description = "Akamai Property Product ID"
  type        = string
  default     = "Fresca"
}

# -------------------------------------------------
# Edge Hostname
# -------------------------------------------------

variable "edge_hostname" {
  description = "Akamai Edge Hostname"
  type        = string
}

variable "edge_hostname_ip_behavior" {
  description = "Akamai Edge Hostname IP behavior (IPV4|IPV6_COMPLIANCE)"
  type        = string
  default     = "IPV6_COMPLIANCE"
}

# -------------------------------------------------
# Property
# -------------------------------------------------

variable "property_name" {
  description = "Akamai Property/Configuration Name"
  type        = string
}

variable "property_hostnames" {
  type        = list(string)
  description = "Hostnames"
}

variable "cp_code_name" {
  description = "Name for the CP Code"
  type        = string
}

variable "origin_parameters" {
  type = object({
    name    = string
    cp_code = number
    type    = string
  })
}

variable "version_notes" {
  type        = string
  description = "Version Notes for the Property"
}

variable "email" {
  type        = string
  description = "Notification email"
}
