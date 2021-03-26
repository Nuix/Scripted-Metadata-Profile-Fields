# Returns unique addressess from TO, CC, BCC, and FROM fields.
communication = $current_item.get_communication
return if communication.nil?

# Get java.util.List<Address> for each field
address_fields = [communication.get_from, communication.get_to, communication.get_cc, communication.get_bcc]
# Get Addresses and remove duplicates
addresses = address_fields.map(&:to_a).flatten.uniq
# Return joined display strings
addresses.map(&:to_display_string).join('; ')
