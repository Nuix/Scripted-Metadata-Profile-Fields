Pathing Fields
==================

This folder contains several fields related to calculating Path related values for items.  

The examples below are based on an EML file named `Email001.eml` which is contained within a Zip file named `Kovacek_Gracie.zip` which is located on the file system in a directory `D:\natives\FakeData\`.

Name used in examples was randomly generated.

## [ScriptedField_FullPath.rb](https://github.com/Nuix/Scripted-Metadata-Profile-Fields/blob/master/Ruby/Pathing/ScriptedField_FullPath.rb)
Provides a path value which includes the file system path of the `flag:physical_file` that contained the item (if there is one) and the item path to the item including the name of the given item.

Example: `D:\natives\FakeData\Kovacek_Gracie.zip/Email0001.eml`

## [ScriptedField_ItemPathAndItemName.rb](https://github.com/Nuix/Scripted-Metadata-Profile-Fields/blob/master/Ruby/Pathing/ScriptedField_ItemPathAndItemName.rb)

Provides a path value containing the given item's item path ending with the given item's name.

Example: `Evidence 1/FakeData/Kovacek_Gracie.zip/Email0001.eml`

## [ScriptedField_CaseNameAndItemPathAndItemName.rb](https://github.com/Nuix/Scripted-Metadata-Profile-Fields/blob/master/Ruby/Pathing/ScriptedField_CaseNameAndItemPathAndItemName.rb)

This scripted field is similar to `ScriptedField_ItemPathAndItemName.rb`, with the addition that the name of the item's containing case is the first element in the path value.  For example, if the case is named `Case001`, then you might get a value like the following:

Example: `Case001/Evidence 1/FakeData/Kovacek_Gracie.zip/Email0001.eml`

## [ScriptedField_PhysicalAncestorFilePath.rb](https://github.com/Nuix/Scripted-Metadata-Profile-Fields/blob/master/Ruby/Pathing/ScriptedField_PhysicalAncestorFilePath.rb)
Provides a field which contains the file system path of the `flag:physical` file ancestor the given item came from (if there was one).  If the given item itself is `flag:physical_file` then this will be the file system path for the given item.

Example: `D:\natives\FakeData\Kovacek_Gracie.zip`

## [ScriptedField_PhysicalFilePath.rb](https://github.com/Nuix/Scripted-Metadata-Profile-Fields/blob/master/Ruby/Pathing/ScriptedField_PhysicalFilePath.rb)

Provides the file system path for the given item if it is `flag:physical_file`.  If it is not `flag:physical_file`, yields a blank value.

For the zip item this would be `D:\natives\FakeData\Kovacek_Gracie.zip`, for the EML item this would be blank since it it contained within the `flag:physical_file` item `Kovacek_Gracie.zip`.

## [ScriptedField_PhysicalFilePathExists.rb](https://github.com/Nuix/Scripted-Metadata-Profile-Fields/blob/master/Ruby/Pathing/ScriptedField_PhysicalFilePathExists.rb)

Similar to [ScriptedField_PhysicalFilePath.rb](https://github.com/Nuix/Scripted-Metadata-Profile-Fields/blob/master/Ruby/Pathing/ScriptedField_PhysicalFilePath.rb) except this field then takes the determined file system path and checks whether the specified file actually exists, returning `true` if is does and `false` if not.  This field will also yield blank values if the given item is not `flag:physical_file`.

## [ScriptedField_ItemPathWithoutEvidenceContainerName.rb](https://github.com/Nuix/Scripted-Metadata-Profile-Fields/blob/master/Ruby/Pathing/ScriptedField_ItemPathWithoutEvidenceContainerName.rb)

Item path, without the leading evidence container name.  For example, if the evidence container for an item was named `Kovacek Gracie - Emails` and the path to an item was `/Kovacek Gracie - Emails/Emails/Sent/00000013_Ignore Cardiovascular Disease.eml`, this field would instead yield `/Emails/Sent/00000013_Ignore Cardiovascular Disease.eml`.

## [ScriptedField_HasChildren.rb](https://github.com/Nuix/Scripted-Metadata-Profile-Fields/blob/master/Ruby/Pathing/ScriptedField_HasChildren.rb)

Yields `true` if the items has child items, `false` if it does not.

## [ScriptedField_ImmediateContainerAncestorName.rb](https://github.com/Nuix/Scripted-Metadata-Profile-Fields/blob/master/Ruby/Pathing/ScriptedField_ImmediateContainerAncestorName.rb)

Searches bottom up through the ancestor items of the given item, finding the first kind container and yielding its name.  Yields blank if none is found.  Excludes Nuix evidence container items.

## [ScriptedField_NonEmailImmediateContainerAncestorName.rb](https://github.com/Nuix/Scripted-Metadata-Profile-Fields/blob/master/Ruby/Pathing/ScriptedField_NonEmailImmediateContainerAncestorName.rb)

If the item is not kind email, searches bottom up through the ancestor items of the given item, finding the first kind container and yielding its name.  Yields blank if none is found.  Excludes Nuix evidence container items.

## [ScriptedField_TopMostContainerAncestorName.rb](https://github.com/Nuix/Scripted-Metadata-Profile-Fields/blob/master/Ruby/Pathing/ScriptedField_TopMostContainerAncestorName.rb)

Searches top down through the ancestor items of the given item, finding the first kind container and yielding its name.  Yields blank if none is found.  Excludes Nuix evidence container items.