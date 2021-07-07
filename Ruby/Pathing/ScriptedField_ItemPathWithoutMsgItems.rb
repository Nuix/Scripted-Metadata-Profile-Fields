# Get the path items for the current item, will include the current item as the last element
path_items = $current_item.getPath

if path_items.size < 2
	return "/"
else
	# Remove current item from path items
	path_items = path_items[0..path_items.size-2]
	# Remove any items remaining in the path which are MSG
	path_items = path_items.reject{|item| item.getType.getName == "application/vnd.ms-outlook-msg"}
	# Convert remaining path items to a collection of the items' names
	path_names = path_items.map{|item| item.getLocalisedName}
	# Return our customized item path / path name
	return "/"+path_names.join("/")
end