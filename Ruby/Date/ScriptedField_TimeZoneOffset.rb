# Returns offset of investigation time zone (in hours).

timezone_id = $current_case.get_investigation_time_zone
timezone = org.joda.time.DateTimeZone.forID(timezone_id)
timezone.get_offset(org.joda.time.DateTime.now) / 3_600_000
