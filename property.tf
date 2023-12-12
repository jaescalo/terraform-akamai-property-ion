data "akamai_contract" "contract" {
  group_name = var.group_name
}

resource "akamai_cp_code" "cp_code" {
  product_id  = var.product_id
  contract_id = data.akamai_contract.contract.id
  group_id    = data.akamai_contract.contract.group_id
  name        = var.cp_code_name
}

resource "akamai_edge_hostname" "wingmanstrums-com_edge_hostname" {
  product_id    = var.product_id
  contract_id   = data.akamai_contract.contract.id
  group_id      = data.akamai_contract.contract.group_id
  ip_behavior   = var.edge_hostname_ip_behavior
  edge_hostname = var.edge_hostname
}


resource "akamai_property" "wingmanstrums-com" {
  name        = var.property_name
  contract_id = data.akamai_contract.contract.id
  group_id    = data.akamai_contract.contract.group_id
  product_id  = var.product_id

  dynamic "hostnames" {
    for_each = var.property_hostnames
    content {
      cname_from             = hostnames.value
      cname_to               = akamai_edge_hostname.wingmanstrums-com_edge_hostname.edge_hostname
      cert_provisioning_type = "DEFAULT"
    }
  }

  rule_format = data.akamai_property_rules_builder.wingmanstrums-com_rule_default.rule_format
  rules       = replace(data.akamai_property_rules_builder.wingmanstrums-com_rule_default.json, "\"rules\"", "\"comments\": \"${var.version_notes}\", \"rules\"")
}

resource "akamai_property_activation" "wingmanstrums-com-staging" {
  property_id                    = akamai_property.wingmanstrums-com.id
  contact                        = [var.email]
  version                        = akamai_property.wingmanstrums-com.latest_version
  network                        = "STAGING"
  auto_acknowledge_rule_warnings = true
}

resource "akamai_property_activation" "wingmanstrums-com-production" {
  property_id                    = akamai_property.wingmanstrums-com.id
  contact                        = [var.email]
  version                        = akamai_property.wingmanstrums-com.latest_version
  network                        = "PRODUCTION"
  auto_acknowledge_rule_warnings = true
}
