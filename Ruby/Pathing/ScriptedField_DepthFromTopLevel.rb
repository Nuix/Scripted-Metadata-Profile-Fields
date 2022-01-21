# Yields the depth from this item to its top level item
# Example: Child of email is depth 1, child of that depth 2 and so on
# If the item has no top level item, this yields 0

top_level_item = $current_item.getTopLevelItem

if top_level_item.nil?
	return 0
else
	top_level_item_depth = top_level_item.getPosition.toArray.length
	current_item_depth = $current_item.getPosition.toArray.length
	return current_item_depth - top_level_item_depth
end