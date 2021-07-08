Miscellaneous
=============

This folder contains scripted profile fields which don't necessarily fall into one of the other categories.

| Field | Notes |
|-------|-------|
| [ScriptedField_CustomizedItemCategories.rb](https://github.com/Nuix/Scripted-Metadata-Profile-Fields/blob/master/Ruby/Misc/ScriptedField_CustomizedItemCategories.rb) | Map the item category assigned by Nuix to a customized name.  See documentation for [Item.getItemCategory](https://download.nuix.com/releases/desktop/stable/docs/en/scripting/api/nuix/Item.html#getItemCategory()). |
| [ScriptedField_HasChildren.rb](https://github.com/Nuix/Scripted-Metadata-Profile-Fields/blob/master/Ruby/Misc/ScriptedField_HasChildren.rb) | Yields `true` if the item has children and `false` if it does not. |
| [ScriptedField_NonEmailExtension.rb](https://github.com/Nuix/Scripted-Metadata-Profile-Fields/blob/master/Ruby/Misc/ScriptedField_NonEmailExtension.rb) | If the item is not kind email, this field attempts to extract an extension from the name of the item. |
| [ScriptedField_NonEmailHasChildren.rb](https://github.com/Nuix/Scripted-Metadata-Profile-Fields/blob/master/Ruby/Emails/ScriptedField_NonEmailHasChildren.rb) | If item is not kind email, yields `true` if is has children and `false` if it does not.  If item is an email, yields a blank value. |
| [ScriptedField_NonEmailSubject.rb](https://github.com/Nuix/Scripted-Metadata-Profile-Fields/blob/master/Ruby/Emails/ScriptedField_NonEmailSubject.rb) | If the item is not kind email, yields the value of the `subject` metadata property, else yields a blank value. |