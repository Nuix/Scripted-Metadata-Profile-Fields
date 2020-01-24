QC Fields
============================

This folder contains scripted profile fields related to reporting information for quality control.

| Field | Notes |
|-------|-------|
| [ScriptedField_DigestLists.rb](https://github.com/Nuix/Scripted-Metadata-Profile-Fields/blob/master/Ruby/QC/ScriptedField_DigestLists.rb) | This field reports a delimited list of digest lists that a given item's MD5 is a member of.|
| [ScriptedField_IrregularCategory.rb](https://github.com/Nuix/Scripted-Metadata-Profile-Fields/blob/master/Ruby/QC/ScriptedField_IrregularCategory.rb) | This field will contain a delimited list of all the irregular items categories a given item is a member of.|
| [ScriptedField_WordCount.rb](https://github.com/Nuix/Scripted-Metadata-Profile-Fields/blob/master/Ruby/QC/ScriptedField_WordCount.rb) | This field contains the number of words, calculated by taking the item's text string, converting non-alphabet characters to space, and splitting on whitespace (i.e. `String.gsub(/[^-a-zA-Z]/, ' ').split.size`). This works because `string.split` splits on whitespace with leading whitespace and runs of contiguous whitespace characters ignored.|
