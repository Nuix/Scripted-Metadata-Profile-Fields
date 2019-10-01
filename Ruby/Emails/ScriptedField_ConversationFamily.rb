properties = $current_item.get_properties
# First non-blank value from Mapi-Conversation-Index and Thread-Index
index = properties['Mapi-Conversation-Index'] || properties['Thread-Index']
# Ignore items without an index
return nil if index.nil?

# Handle Mapi-Conversation-Index Byte[]
index = index.to_s.unpack('H*')[0] if index.is_a?(Java::byte[])
# Return first 44 characters, and use uppercase
index[0, 44].upcase
