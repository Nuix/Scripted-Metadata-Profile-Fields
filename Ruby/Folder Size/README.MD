Folder Size Fields
==================

This folder contains several fields related to calculating "Folder Sizes".  Each script generally uses the following logic to calculate its value:

1. If the item is not MIME type `filesystem/directory`, a blank value is returned
2. If the item is MIME type `filesystem/directory`:
	1. Get the item's descendants
	2. Filter out any descendant items which are not [Physical File items](https://download.nuix.com/releases/desktop/stable/docs/en/scripting/api/nuix/Item.html#isPhysicalFile--) (they won't hit on the search `flag:physical_file`).
	3. Calculate the sum of all the remaining descendants file size values (as obtained by calling [Item.getFileSize](https://download.nuix.com/releases/desktop/stable/docs/en/scripting/api/nuix/ItemMetadata.html#getFileSize--)).

The scripts then differ slightly in how they present the final sum.

| File | Note | Example |
|------|------|---------|
| [ScriptedField_FolderSize_Bytes.rb](https://github.com/Nuix/Scripted-Metadata-Profile-Fields/blob/master/Ruby/Folder%20Size/ScriptedField_FolderSize_Bytes.rb) | Yields the sum as a total number of bytes. | `98,429,300` |
| [ScriptedField_FolderSize_MB.rb](https://github.com/Nuix/Scripted-Metadata-Profile-Fields/blob/master/Ruby/Folder%20Size/ScriptedField_FolderSize_MB.rb) | Yields the sum as the size in MB, rounded to 3 decimal places. | `93.869` |
| [ScriptedField_FolderSize_GB.rb](https://github.com/Nuix/Scripted-Metadata-Profile-Fields/blob/master/Ruby/Folder%20Size/ScriptedField_FolderSize_GB.rb) | Yields the sum as the size in GB, rounded to 3 decimal places. | `0.092` |
| [ScriptedField_FolderSize_Dynamic.rb](https://github.com/Nuix/Scripted-Metadata-Profile-Fields/blob/master/Ruby/Folder%20Size/ScriptedField_FolderSize_Dynamic.rb) | Yields the sum as the size in whatever unit best represents the size, rounded to 3 decimal places.  So if the value is less than 1KB, its reported in Bytes.  If the value is less than 1MB, its reported in KB, and so on. | `93.869 MB` |

![image](https://user-images.githubusercontent.com/11775738/54221119-16dc9b00-44b0-11e9-9352-cd1fd8d8a6c4.png)

Scripts that convert the sum into a unit (MB, GB, Dyanmic) use 1KB = 1024B, 1MB = 1024KB.  If you prefer to instead use the [SI units](https://en.wikipedia.org/wiki/Kilobyte#Base_10_(1000_bytes)), such as 1KB = 1000B, then you can edit this line at the top of each relevant script:

```ruby
SIZE_BASE_UNIT = 1024.0
```

Changing the value to instead be:

```ruby
SIZE_BASE_UNIT = 1000.0
```