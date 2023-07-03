# Yields a list of entities present on the given item
entity_types = $current_case.getAllEntityTypes
count_breakdown = []
entity_types.each do |type|
	type_count = $current_item.getEntities(type).size
	count_breakdown << type if type_count > 0
end
return count_breakdown.join("; ")