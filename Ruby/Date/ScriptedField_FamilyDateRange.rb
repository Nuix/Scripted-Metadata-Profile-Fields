date_format = "YYYYMMdd"

# Time zone we will specify our date range in, also specifies the time zone
# to which the item dates will be converted to
time_zone = org.joda.time.DateTimeZone.getDefault

family_items = $current_item.getFamily
if family_items.nil?
	return ""
end
family_dates = family_items.map{|i| i.getDate}
valid_family_dates = family_dates.reject{|d| d.nil?}
valid_family_dates = valid_family_dates.map{|d| d.withZone(time_zone)}
sorted_family_dates = valid_family_dates.sort

# Value returned if there are no dates to report
no_dates_values = ""

if sorted_family_dates.size == 0
	return no_dates_values
elsif sorted_family_dates.size == 1
	return sorted_family_dates.first.toString(date_format)
else
	start = sorted_family_dates.first.toString(date_format)
	finish = sorted_family_dates.last.toString(date_format)
	return "#{start} - #{finish}"
end