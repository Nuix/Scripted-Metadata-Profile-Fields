# Report named entities on item and the count of each
# If "include_zero_count_entities" is true, entities with 0 occurrences are reported
# If "include_zero_count_entities" is false, entities with 0 occurrences are NOT reported
include_zero_count_entities = false
entity_types = $current_case.getAllEntityTypes
count_breakdown = []
entity_types.each do |type|
	type_count = $current_item.getEntities(type).size
	count_breakdown << "#{type}:#{type_count}" if (type_count > 0 || include_zero_count_entities)
end
return count_breakdown.join("; ")