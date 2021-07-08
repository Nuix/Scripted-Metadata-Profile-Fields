# Get the path items for the current item, will not include the current item as the last element
path_names = $current_item.getLocalisedPathNames

if path_names.size < 2
	return "/"
else
	# Remove current item from path names and evidence container name
	path_names = path_names[1..path_names.size-2]
	# Return our customized item path / path name
	return "/"+path_names.join("/")
end