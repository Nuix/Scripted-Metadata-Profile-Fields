# For items which are not an email, attempts to extract and yield an extension

kind = $current_item.getKind.getName
if kind.downcase.strip == "email"
	return ""
else
	item_name = $current_item.getName
	if item_name =~ /\./
		return File.extname(item_name)
	else
		return ""
	end
end