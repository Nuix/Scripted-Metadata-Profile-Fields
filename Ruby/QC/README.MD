QC Fields
============================

This folder contains scripted profile fields related to reporting information for quality control.

| Field | Notes |
|-------|-------|
| [ScriptedField_BytesSize.rb][ScriptedField_BytesSize] | Yields the file size or digest input size, in bytes. |
| [ScriptedField_DecryptionPassword.rb][ScriptedField_DecryptionPassword] | Provides the password used to decrypt an item, if there is one. |
| [ScriptedField_DigestLists.rb][ScriptedField_DigestLists] | This field reports a delimited list of digest lists that a given item's MD5 is a member of.|
| [ScriptedField_EntityCount.rb][ScriptedField_EntityCount] | This field reports the number of occurences of each named entity within the item's text.|
| [ScriptedField_IrregularCategory.rb][ScriptedField_IrregularCategory] | This field will contain a delimited list of all the irregular items categories a given item is a member of.|
| [ScriptedField_Loaded.rb][ScriptedField_Loaded] | This field will contain the date/time the item was loaded.|
| [ScriptedField_MsgMd5.rb][ScriptedField_MsgMd5] | If the item's parent is a Microsoft Outlook Message container, this field will contain the MD5 of the parent wrapper.|
| [ScriptedField_TermCount.rb][ScriptedField_TermCount] | Yields the number of occurrences of a term in the item's text. |
| [ScriptedField_WordCount.rb][ScriptedField_WordCount] | This field yields the number total term occurrences in the given item's content text.|

[ScriptedField_BytesSize]: https://github.com/Nuix/Scripted-Metadata-Profile-Fields/blob/master/Ruby/QC/ScriptedField_BytesSize.rb
[ScriptedField_DecryptionPassword]: https://github.com/Nuix/Scripted-Metadata-Profile-Fields/blob/master/Ruby/QC/ScriptedField_DecryptionPassword.rb
[ScriptedField_DigestLists]: https://github.com/Nuix/Scripted-Metadata-Profile-Fields/blob/master/Ruby/QC/ScriptedField_DigestLists.rb
[ScriptedField_EntityCount]: https://github.com/Nuix/Scripted-Metadata-Profile-Fields/blob/master/Ruby/QC/ScriptedField_EntityCount.rb
[ScriptedField_IrregularCategory]: https://github.com/Nuix/Scripted-Metadata-Profile-Fields/blob/master/Ruby/QC/ScriptedField_IrregularCategory.rb
[ScriptedField_Loaded]: https://github.com/Nuix/Scripted-Metadata-Profile-Fields/blob/master/Ruby/QC/ScriptedField_Loaded.rb
[ScriptedField_MsgMd5]: https://github.com/Nuix/Scripted-Metadata-Profile-Fields/blob/master/Ruby/QC/ScriptedField_MsgMd5.rb
[ScriptedField_TermCount]: https://github.com/Nuix/Scripted-Metadata-Profile-Fields/blob/master/Ruby/QC/ScriptedField_TermCount.rb
[ScriptedField_WordCount]: https://github.com/Nuix/Scripted-Metadata-Profile-Fields/blob/master/Ruby/QC/ScriptedField_WordCount.rb
