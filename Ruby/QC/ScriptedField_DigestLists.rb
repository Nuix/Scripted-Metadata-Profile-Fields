DELIMITER = '; '
lists = $utilities.get_digest_list_store.get_digest_list_names.select do |name|
  $current_item.matches_search("digest-list:\"#{name}\"")
  # this may error in a compound case, if the digest list exists only in the compound case (and not in the user or simple case), as matches_search() runs in the simple case.
end
lists.sort.join(DELIMITER)
