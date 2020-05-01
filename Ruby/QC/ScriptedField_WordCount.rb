# Yields the number total term occurrences in the given item's content text.
case_stats = $current_case.get_statistics
# get term statistics for item's content field
term_stats = case_stats.get_term_statistics("guid:#{$current_item.get_guid}", 'field' => 'content')
# count total term ocurrences
term_stats.map { |_t, c| c }.reduce(0, :+)
