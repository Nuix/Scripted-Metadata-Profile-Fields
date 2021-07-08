Email Information Fields
============================

This folder contains scripted profile fields related to reporting information about emails.

| Field | Notes |
|-------|-------|
| [ScriptedField_ConversationFamily.rb](https://github.com/Nuix/Scripted-Metadata-Profile-Fields/blob/master/Ruby/Emails/ScriptedField_ConversationFamily.rb) | Relational field for conversation threads. This is a 44-character string of numbers and letters that is created in the initial email.|
| [ScriptedField_AllAddresses.rb](https://github.com/Nuix/Scripted-Metadata-Profile-Fields/blob/master/Ruby/Emails/ScriptedField_AllAddresses.rb) | Unique addressess from TO, CC, BCC, and FROM fields.|
| [ScriptedField_MAPI_Read.rb](https://github.com/Nuix/Scripted-Metadata-Profile-Fields/blob/master/Ruby/Emails/ScriptedField_MAPI_Read.rb) | Does the item have metadata property `Mapi-Message-Flags` and does it contain the flag `read`?  Returns `true`/`false`.  Only yields values for items which are kind `email`. |
| [ScriptedField_MAPI_EverRead.rb](https://github.com/Nuix/Scripted-Metadata-Profile-Fields/blob/master/Ruby/Emails/ScriptedField_MAPI_EverRead.rb) | Does the item have metadata property `Mapi-Message-Flags` and does it contain the flag `ever read`?  Returns `true`/`false`.  Only yields values for items which are kind `email`. |
| [ScriptedField_MAPI_FromMe.rb](https://github.com/Nuix/Scripted-Metadata-Profile-Fields/blob/master/Ruby/Emails/ScriptedField_MAPI_FromMe.rb) | Does the item have metadata property `Mapi-Message-Flags` and does it contain the flag `from me`?  Returns `true`/`false`.  Only yields values for items which are kind `email`. |
| [ScriptedField_MAPI_Unsent.rb](https://github.com/Nuix/Scripted-Metadata-Profile-Fields/blob/master/Ruby/Emails/ScriptedField_MAPI_Unsent.rb) | Does the item have metadata property `Mapi-Message-Flags` and does it contain the flag `unsent`?  Returns `true`/`false`.  Only yields values for items which are kind `email`. |
| [ScriptedField_MAPI_HasAttachment.rb](https://github.com/Nuix/Scripted-Metadata-Profile-Fields/blob/master/Ruby/Emails/ScriptedField_MAPI_HasAttachment.rb) | Does the item have metadata property `Mapi-Message-Flags` and does it contain the flag `has attachment`?  Returns `true`/`false`.  Only yields values for items which are kind `email`. |
| [ScriptedField_EmailHasChildren.rb](https://github.com/Nuix/Scripted-Metadata-Profile-Fields/blob/master/Ruby/Emails/ScriptedField_EmailHasChildren.rb) | If item is an email, yields `true` if is has children and `false` if it does not.  If item is not an email, yields a blank value. |
| [ScriptedField_EmailSubject.rb](https://github.com/Nuix/Scripted-Metadata-Profile-Fields/blob/master/Ruby/Emails/ScriptedField_EmailSubject.rb) | If the item is an email, yields the value of the `subject` metadata property, else yields a blank value. |