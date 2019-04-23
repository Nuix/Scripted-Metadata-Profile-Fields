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

## [ScriptedField_PhysicalAncestorFilePath.rb](https://github.com/Nuix/Scripted-Metadata-Profile-Fields/blob/master/Ruby/Pathing/ScriptedField_PhysicalAncestorFilePath.rb)
Provides a field which contains the file system path of the `flag:physical` file ancestor the given item came from (if there was one).  If the given item itself is `flag:physical_file` then this will be the file system path for the given item.

Example: `D:\natives\FakeData\Kovacek_Gracie.zip`

## [ScriptedField_PhysicalFilePath.rb](https://github.com/Nuix/Scripted-Metadata-Profile-Fields/blob/master/Ruby/Pathing/ScriptedField_PhysicalFilePath.rb)

Provides the file system path for the given item if it is `flag:physical_file`.  If it is not `flag:physical_file`, yields a blank value.

For the zip item this would be `D:\natives\FakeData\Kovacek_Gracie.zip`, for the EML item this would be blank since it it contained within the `flag:physical_file` item `Kovacek_Gracie.zip`.