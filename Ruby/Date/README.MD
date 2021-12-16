Date Fields
==================

| Field | Notes | Example |
|-------|-------|---------|
| [ScriptedField_FamilyDateRange.rb](https://github.com/Nuix/Scripted-Metadata-Profile-Fields/blob/master/Ruby/Date/ScriptedField_FamilyDateRange.rb) | For a given item, displays a date range value containing the earliest and latest dates of the family of items to which the given item belongs.  | `20171222 - 20180312` |
| [ScriptedField_HideInvalidDates.rb](https://github.com/Nuix/Scripted-Metadata-Profile-Fields/blob/master/Ruby/Date/ScriptedField_HideInvalidDates.rb) | This field only yields an item's date value if it lies within a specified date range specified in the scripted field. | `Monday, March 12, 2018 at 11:50:05 PM Pacific Daylight Time` |
| [ScriptedField_MakeDateTime.rb](https://github.com/Nuix/Scripted-Metadata-Profile-Fields/blob/master/Ruby/Date/ScriptedField_MakeDateTime.rb) | This field parses a text property and creates a DateTime object.  | `Monday, March 12, 2018 at 11:50:05 PM Pacific Daylight Time` |
| [ScriptedField_SpecificTimeZone.rb](https://github.com/Nuix/Scripted-Metadata-Profile-Fields/blob/master/Ruby/Date/ScriptedField_SpecificTimeZone.rb) | This field yields the item's date value in a specific time zone. | `2020-31-13 05:31:19 PM Hawaii Standard Time` |
| [ScriptedField_TimeZoneOffset.rb](https://github.com/Nuix/Scripted-Metadata-Profile-Fields/blob/master/Ruby/Date/ScriptedField_TimeZoneOffset.rb) | This field yields the offset of investigation time zone in hours.  | `-8` |
