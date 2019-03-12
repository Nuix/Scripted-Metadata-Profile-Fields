mime_type = $current_item.getType.getName
if mime_type != "filesystem/directory"
	return ""
else
	descendants = $current_item.getDescendants
	physical_file_descendants = descendants.select{|d| d.isPhysicalFile}
	file_size_sum = physical_file_descendants.inject(0){|sum,d| sum += d.getFileSize}
	return file_size_sum
end