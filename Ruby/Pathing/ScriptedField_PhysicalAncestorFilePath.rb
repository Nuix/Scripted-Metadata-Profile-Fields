def get_physical_path(item)
	result = {
		:success => true,
		:value => "",
		:error => "",
	}
	# Some items have odd URI values containing a : which causes a Java NIO library
	# to throw an exception so we should be ready for this
	begin
		uri = item.getUri
	rescue Exception => exc
		result[:error] = "Error fetching URI for item => GUID: #{item.getGuid} NAME: #{item.getLocalisedName}"
		result[:success] = false
		return result
	end

	if uri.nil?
		result[:error] = "Item has no URI value => GUID: #{item.getGuid} NAME: #{item.getLocalisedName}"
		result[:success] = false
		return result
	else
		strPath = nil
		begin
			# Create a URI object to get the path - no escapes
			uriOutput = java.net.URI.new(uri)
			strOutput = uriOutput.getPath()
			
			# check for a host.  If this is a UNC path, the host will not
			# be included in the path
			strHost = uriOutput.getHost()
			if strHost.nil?
				# remove the first character - this is an unneeded /
				strPath = strOutput[1..-1]
			else
				strPath = "\\\\"
				strPath += strHost
				strPath += strOutput
			end
			
			# Normalize path slashes if it looks like we have a path like
			# D:\path
			# AB:\path
			# \\Server\Path
			if strPath.match("^[a-zA-Z]{1,2}:") || strPath.match("^\\\\")
				# convert forward slashes to back slashes
				strPath.gsub!('/','\\')
			end
		rescue Exception => ex
			result[:error] = "Error parsing URI '#{exc.message}' => GUID: #{item.getGuid} NAME: #{item.getLocalisedName}"
			result[:success] = false
			return result
		end

		result[:value] = strPath
		result[:success] = true
		return result
	end
end

# Recursive method to return an item's closest physical ancestor
# If the item is a physical file, returns item
# If there is no physical ancestor, returns nil
def find_physical_ancestor(item)
	if item.isPhysicalFile
		return item
	else
		parent = item.getParent
		if !parent.nil?
			find_physical_ancestor(parent)
		else
			return nil
		end
	end
end

# Value when the current item is not flag:physical_file and does not
# have an ancestor which is flag:physical_file
no_physical_ancestor_value = ""

# When true, errors will show up as the field value, when false
# items which have errors will yield blank values
yield_error_messages = true

# If the current item if flag:physical_file we will use it, otherwise
# we will try to find an ancestor item which is flag:physical_file, if
# there is also no ancestor that qualifies we return no_physical_ancestor_value
item = $current_item
if item.isPhysicalFile == false
	item = find_physical_ancestor(item)
end

if item.nil?
	return no_physical_ancestor_value
end

# If we have reached here, we have located a flag:physical_file items to report
# on and now we just need to calculate its file path
result = get_physical_path(item)
if result[:success] == false
	if yield_error_messages
		return result[:error]
	else
		return ""
	end
else
	return result[:value]
end