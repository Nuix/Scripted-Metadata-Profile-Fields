# Displays item date in specified time zone

# Time zone to use
zone = org.joda.time.DateTimeZone.forID('HST')
# Format for string
format = 'yyy-mm-dd hh:mm:ss a zzzz'

item_date = $current_item.getDate
return if item_date.nil?

item_date.withZone(zone).toString(format)
