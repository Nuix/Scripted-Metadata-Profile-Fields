# If item is kind email, yields true if it has children, false if it does not
# If the item is not kind email, yields blank

kind = $current_item.getKind.getName
if kind.downcase.strip != "email"
	return ""
else
	child_count = $current_items.getChildren.size
	return child_count > 0
end