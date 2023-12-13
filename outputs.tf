output "contract_id" {
    description = "Akamai Contract ID"
  value = data.akamai_contract.contract.id
}

output "group_id" {
  description = "Aakamai Group ID"
  value = data.akamai_contract.contract.group_id
}

output "property_id" {
  description = "Akamai Property ID"
  value = akamai_property.my-resource.id
}


