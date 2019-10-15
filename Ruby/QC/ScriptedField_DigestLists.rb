DELIMITER = '; '
lists = $utilities.get_digest_list_store.get_digest_list_names.select do |name|
  $current_item.matches_search("digest-list:\"#{name}\"")
end
lists.sort.join(DELIMITER)
