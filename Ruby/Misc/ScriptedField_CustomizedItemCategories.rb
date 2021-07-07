# Map the item category assigned by Nuix to a customized name
# See Item.getItemCategory: https://download.nuix.com/releases/desktop/stable/docs/en/scripting/api/nuix/Item.html#getItemCategory()
# Define how Nuix value (left side) will be mapped to field (right side)
mapping = {
	"Email" => "Email",
	"Attachment" => "Attachment",
	"Electronic File" => "EFile",
	"Electronic Directory" => "",
}

# Get item category Nuix has assigned
item_category = $current_item.getItemCategory

# Convert to how we want it defined (see 'mapping' above)
mapped_value = mapping[item_category]

# Yield our mapped value for this item
return mapped_value || ""