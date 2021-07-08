# If item in not kind email, finds the most immediate ancestor container and yields its name, excluding
# Nuix evidence container items.  Yields a blank value if none is found.

kind = $current_item.getKind.getName
if kind.downcase.strip == "email"
	return ""
else
	path_items = $current_item.getPath
	path_items.reverse_each do |item|
		# Don't report this item if it is a container
		next if item == $current_item

		kind = item.getKind.getName
		if kind.downcase.strip == "container"
			# We don't want to report evidence container name
			next if item.getType.getName == "application/vnd.nuix-evidence"
			
			return item.getLocalisedName
		end
	end

	# If we reached here we didn't find one above
	return ""
end