text = $current_item.get_text_object
# skip items without stored text
return unless text.isAvailable

# convert non-alphabet characters to space
text_string = text.to_string.gsub(/[^-a-zA-Z]/, ' ')
# split on whitepsace and return size of array
text_string.split.size
