require 'date'
# Specify the text property
property = 'Exif SubIFD: Date/Time Original'
value = $current_item.get_properties[property]
# Skip if no value
return if value.nil?

# DateTime format string
format = '%Y:%m:%d %H:%M:%S'
begin
  DateTime.strptime(value, format)
rescue StandardError
  'Invalid Date'
end
