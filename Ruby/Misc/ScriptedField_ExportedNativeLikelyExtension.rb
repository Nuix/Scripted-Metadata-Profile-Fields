# Yields a guess at the extension that will be assigned to exported natives:
# - If item is kind email and email export format not specified as "native", yield hard coded value since
#   it will be dependent on the format you use when exporting.  Value of native will yield a value based on
#   further logic below.
# - Else if item is Outlook folder or file system directory, yield "txt"
# - Else if item is "filesystem/inaccessible" yield "pdf"
# - Else do the following:
#   - If Item.getOriginalExtension returns a value, use that
#   - Else if Item.getPreferredExtension returns a value, use that
#   - Else if nothing else gives us something useful, yield "txt" as it likely yields
#     a placeholder text file in native export

# Set this to extension matching the email export format you choose (msg,eml,html,etc)!
# If you export using NATIVE (where Nuix chooses to some degree) then use "native"
$email_format = "msg"

def get_export_extension(item)
	item_kind = item.getKind.getName
	item_mime_type = item.getType.getName
	native_extension = "txt"
	if item.getKind.getName == "email" && $email_format.downcase.strip != "native"
		native_extension = $email_format
	elsif item_mime_type == "application/vnd.ms-outlook-folder" || item_mime_type == "filesystem/directory"
		native_extension = "txt"
	elsif item_mime_type == "filesystem/inaccessible"
		native_extension = "pdf"
	else
		native_extension = item.getCorrectedExtension

		if native_extension.nil? || native_extension.strip.empty?
			native_extension = item.getOriginalExtension
		end

		if native_extension.nil? || native_extension.strip.empty?
			native_extension = item.getType.getPreferredExtension
		end

		if native_extension.nil? || native_extension.strip.empty?
			native_extension = "txt"
		end
	end
	return native_extension
end

return get_export_extension(current_item)