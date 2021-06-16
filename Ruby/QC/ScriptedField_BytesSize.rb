# Yields file size or digest input size in bytes.
#
# The size columns (Audited, Digest Input, and File Size)
# are in KB/MB/GB, rather than bytes (old behavior).
# Instead of this, the following switch displays sizes as long:
# -Dnuix.metadata.reportByteSizeAsLong=TRUE

file_size_bytes = $current_item.get_file_size
return file_size_bytes unless file_size_bytes.nil? || !file_size_bytes.positive?

digest_input_size = $current_item.get_digests.get_input_size
return digest_input_size unless digest_input_size.nil? || digest_input_size.negative?

return 0
