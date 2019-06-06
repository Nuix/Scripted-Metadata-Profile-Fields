# Reports item path for all duplicates of this item's top level item, including this item's
# top level item.  If the current item does not have a top level item, the value assigned to
# $value_when_no_top_level is returned for the current item.

$value_when_no_top_level = ""

def get_item_path(item)
	return item.getLocalisedPathNames.join("/")
end

# We will collect individual item paths in paths variable
paths = []
# Get the current item's top level item
top_level_item = $current_item.getTopLevelItem
# If this item does not have a top level item, likely because
# it is "above" top leve, then we return $value_when_no_top_level
if top_level_item.nil?
	return $value_when_no_top_level
end
# Get all duplicates of current item's top level item
duplicate_items = top_level_item.getDuplicates
# Add path to current item's top level item first
paths << get_item_path(top_level_item)
# Add top level item's duplicates' item paths
paths += duplicate_items.map{|dupe_item| get_item_path(dupe_item) }
# Return paths joined
return paths.join(";")