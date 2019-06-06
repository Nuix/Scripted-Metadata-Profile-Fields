# Reports item path for all duplicates of this item, including the item
# path of the current item.

def get_item_path(item)
	return item.getLocalisedPathNames.join("/")
end

# We will collect individual item paths in paths variable
paths = []
# Get all duplicates of the current item
duplicate_items = $current_item.getDuplicates
# Add path to current item
paths << get_item_path($current_item)
# Add paths to current item's duplicates
paths += duplicate_items.map{|dupe_item| get_item_path(dupe_item) }
# Return paths joined
return paths.join(";")