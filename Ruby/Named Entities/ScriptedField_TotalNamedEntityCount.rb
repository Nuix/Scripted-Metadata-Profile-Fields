# Yields a sum total of named entities present on the item
entity_types = $current_case.getAllEntityTypes
counts = entity_types.map{|type|$current_item.getEntities(type).size}
return counts.sum