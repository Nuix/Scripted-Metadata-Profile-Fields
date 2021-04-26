# Yields the number of occurrences of a term in the item's text
term = 'deadbeef'
# Get count from term statistics for this item
case_stats = $current_case.get_statistics
term_stats = case_stats.get_term_statistics("guid:#{$current_item.get_guid}", 'field' => 'content')
count = term_stats[term]
# Return 0 if term is not included
return 0 if count.nil?

count
