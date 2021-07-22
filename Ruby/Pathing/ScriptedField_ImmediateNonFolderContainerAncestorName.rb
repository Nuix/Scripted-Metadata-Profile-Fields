# Finds the most immediate ancestor container and yields its name, skipping over
# certain provided container mime types.  Yields a blank value if none is found.

ignored_container_mime_types = {
	"application/vnd.nuix-evidence" => true,
	"filesystem/directory" => true,
}

path_items = $current_item.getPath
path_items.reverse_each do |item|
	# Don't report this item if it is a container
	next if item == $current_item

	kind = item.getKind.getName

	if kind.downcase.strip == "container"
		# We don't want to report container of certain mime types
		mime_type = item.getType.getName
		next if ignored_container_mime_types[mime_type]
		
		return item.getLocalisedName
	end
end

# If we reached here we didn't find one above
return ""