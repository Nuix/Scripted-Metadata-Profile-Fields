# Displays item date in specified time zone

# Time zone to use (see: http://joda-time.sourceforge.net/timezones.html)
zone = org.joda.time.DateTimeZone.forID('HST')
# Format for string
format = "yyyy-MM-dd'T'HH:mm:ss.SSSZZ"

item_date = $current_item.getDate
# ensure property is a DateTime
return unless item_date.is_a?(Java::OrgJodaTime::DateTime)

item_date.withZone(zone).toString(format)
