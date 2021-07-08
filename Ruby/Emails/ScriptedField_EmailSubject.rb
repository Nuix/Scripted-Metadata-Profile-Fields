# Reports subject only for emails

kind = $current_item.getKind.getName
if kind.downcase.strip != "email"
	return ""
else
	# Used to find subject key in case it has odd capitalization
	subject_pattern = /^subject$/i
	properties = $current_item.getProperties
	
	# Find key which is "subject" (case insensitive)
	subject_key = properties.keys.find{|k|k =~ subject_pattern}
	
	# Return the subject property or blank if nil somehow
	return properties[subject_key] || ""
end