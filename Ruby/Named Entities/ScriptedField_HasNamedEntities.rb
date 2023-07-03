# Yields "true" if item has at least 1 named entity
# Yields "false" if the item has no named entities
entity_types = $current_case.getAllEntityTypes
counts = entity_types.map{|type|$current_item.getEntities(type).size}
return counts.sum > 0