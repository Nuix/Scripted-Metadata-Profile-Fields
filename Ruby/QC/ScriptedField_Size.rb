# Yields file size in kilobytes or kibibytes
#  or digest input size (when file size is not positive)
#  or 0 (when digest input size is also not positive)

DECIMAL_PLACES = 3
SYMBOL = 'KB'
BYTES_PER_UNIT = case SYMBOL
                 when 'kB'
                   1000
                 when 'KB', 'K', 'KiB'
                   1024
                 else
                   return 'Invalid symbol/missing unit value'
end

bytes = $current_item.get_file_size
# Handle non-positive file size
unless !bytes.nil? && bytes.positive?
  bytes = $current_item.get_digests.get_input_size
  # Handle non-positive digest input size
  bytes = 0 unless !bytes.nil? && bytes.positive?
end
# Get units, round, add symbol to string.
return "#{(bytes.to_f / BYTES_PER_UNIT).round(DECIMAL_PLACES)} #{SYMBOL}"
