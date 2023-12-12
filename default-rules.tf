
data "akamai_property_rules_builder" "wingmanstrums-com_rule_default" {
  rules_v2023_10_30 {
    name      = "default"
    is_secure = false
    comments  = "The Default Rule template contains all the necessary and recommended behaviors. Rules are evaluated from top to bottom and the last matching rule wins."
    behavior {
      origin {
        net_storage {
          cp_code              = var.origin_parameters.cp_code
          download_domain_name = var.origin_parameters.name
        }
        origin_type = var.origin_parameters.type
      }
    }
    children = [
      data.akamai_property_rules_builder.wingmanstrums-com_rule_augment_insights.json,
      data.akamai_property_rules_builder.wingmanstrums-com_rule_accelerate_delivery.json,
      data.akamai_property_rules_builder.wingmanstrums-com_rule_offload_origin.json,
      data.akamai_property_rules_builder.wingmanstrums-com_rule_strengthen_security.json,
      data.akamai_property_rules_builder.wingmanstrums-com_rule_increase_availability.json,
      data.akamai_property_rules_builder.wingmanstrums-com_rule_minimize_payload.json
    ]
  }
}