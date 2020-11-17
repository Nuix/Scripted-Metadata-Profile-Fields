# Yield the MD5 of an item's parent Microsoft Outlook Message container.
parent = $current_item.get_parent
return if parent.nil?

if parent.get_type.get_name == 'application/vnd.ms-outlook-msg'
  return parent.get_digests.get_md5
end
