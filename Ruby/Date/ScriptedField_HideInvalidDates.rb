# Displays item date, unless that date falls outside of a specified range

# Time zone we will specify our date range in, also specifies the time zone
# to which the item dates will be converted to
time_zone = org.joda.time.DateTimeZone.getDefault

# Specifies the range we are considering to be valid dates, time is specified
# year, month, day, 0-23 hour, minute, time zone
valid_min_date = org.joda.time.DateTime.new(1900,01,01,0,0,time_zone)
valid_max_date = org.joda.time.DateTime.new(2099,12,31,23,59,time_zone)

# Value if the given item has no item date
value_if_no_date = ""

# Value if the item date present falls outside our specified range
value_if_invalid_date = ""

item_date = $current_item.getDate

if item_date.nil?
	return value_if_no_date
end

# Get the current item's date
item_date = $current_item.getDate.withZone(time_zone)

# Check if the item's date falls within our range
is_before_range = item_date.isBefore(valid_min_date)
is_after_range = item_date.isAfter(valid_max_date)
is_in_range = (is_before_range == false) && (is_after_range == false)

if is_in_range
	return item_date
else
	return value_if_invalid_date
end