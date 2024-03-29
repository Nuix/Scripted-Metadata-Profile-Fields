# Yield true if the given email item has the property "Mapi-Message-Flags" and
# that property contains the flag "ever read", otherwise yield false

def get_message_flags(item)
	properties = item.getProperties
	return [] if !properties.has_key?("Mapi-Message-Flags")
	message_flags_raw = properties["Mapi-Message-Flags"]
	flags_list = message_flags_raw.gsub(/^.*\(([^\)]+)\)$/,"\\1")
	flags = flags_list.split(",").map{|v|v.strip.capitalize}
	return flags
end

# Example target_flag values:
# unmodified
# has attachment
# read
# ever read
# unsent
# from me
def has_message_flag(target_flag, item)
	return get_message_flags(item).any?{|mf| mf.downcase.strip == target_flag.downcase.strip}
end

kind = $current_item.getKind.getName
if kind.downcase.strip != "email"
	return ""
else
	return has_message_flag("ever read",$current_item)
end