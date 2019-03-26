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

# Value if the current item is not flag:physical_file
value_if_not_physical = ""

# When true, errors will show up as the field value, when false
# items which have errors will yield blank values
yield_error_messages = true

if $current_item.isPhysicalFile == false
	return value_if_not_physical
else
	result = get_physical_path($current_item)
	if result[:success] == false
		if yield_error_messages
			return result[:error]
		else
			return ""
		end
	else
		return result[:value]
	end
end