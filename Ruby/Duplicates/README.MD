Duplicate Information Fields
============================

This folder contains scripted profile fields related to reporting information about items which are duplicates of a given item.

| Field | Notes |
|-------|-------|
| [ScriptedField_AllDuplicatePaths.rb](https://github.com/Nuix/Scripted-Metadata-Profile-Fields/blob/master/Ruby/Duplicates/ScriptedField_AllDuplicatePaths.rb) | Reports item path for all duplicates of a given item, including the given item's item path as the first value.  Multiple values are delimited with `;`. |
| [ScriptedField_OtherDuplicatePaths.rb](https://github.com/Nuix/Scripted-Metadata-Profile-Fields/blob/master/Ruby/Duplicates/ScriptedField_OtherDuplicatePaths.rb) | Reports item path for all duplicates of a given item, excluding the given item's item path.  Multiple values are delimited with `;`. |
| [ScriptedField_TopLevelAllDuplicatePaths.rb](https://github.com/Nuix/Scripted-Metadata-Profile-Fields/blob/master/Ruby/Duplicates/ScriptedField_TopLevelAllDuplicatePaths.rb) | Reports item path for all duplicates of this item's top level item, including this item's top level item.  If the current item does not have a top level item, the value assigned to `$value_when_no_top_level` is returned for the current item.  Multiple values are delimited with `;`. |
| [ScriptedField_TopLevelOtherDuplicatePaths.rb](https://github.com/Nuix/Scripted-Metadata-Profile-Fields/blob/master/Ruby/Duplicates/ScriptedField_TopLevelOtherDuplicatePaths.rb) | Reports item path for all duplicates of this item's top level item, excluding this item's top level item.  If the current item does not have a top level item, the value assigned to `$value_when_no_top_level` is returned for the current item.  Multiple values are delimited with `;`. |