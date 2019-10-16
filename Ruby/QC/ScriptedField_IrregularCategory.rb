DELIMITER = '; '
UNSUPPORTED_TYPES = [
  'application/vnd.apache-error-log-entry',
  'application/vnd.git-logstash-log-entry',
  'application/vnd.linux-syslog-entry',
  'application/vnd.logstash-log-entry',
  'application/vnd.ms-iis-log-entry',
  'application/vnd.ms-exchange-stm',
  'application/vnd.ms-shortcut',
  'application/vnd.ms-windows-event-log-record',
  'application/vnd.ms-windows-event-logx-record',
  'application/vnd.ms-windows-setup-api-win7-win8-log-boot-entry',
  'application/vnd.ms-windows-setup-api-win7-win8-log-section-entry',
  'application/vnd.ms-windows-setup-api-xp-log-entry',
  'application/vnd.squid-access-log-entry', 'application/vnd.tcpdump.record',
  'application/vnd.tcpdump.tcp.stream',
  'application/vnd.tcpdump.udp.stream',
  'application/vnd.twitter-logstash-log-entry',
  'application/x-contact',
  'application/x-pcapng-entry',
  'filesystem/x-linux-login-logfile-record',
  'filesystem/x-ntfs-logfile-record',
  'server/dropbox-log-event',
  'text/x-common-log-entry',
  'text/x-log-entry'
].freeze
PROPERTIES = $current_item.get_properties
KIND = $current_item.get_kind.get_name
TYPE = $current_item.get_type.get_name
HAS_EMBEDDED_DATA = $current_item.matches_search('has-embedded-data:1')
HAS_TEXT = $current_item.matches_search('has-text:1')
exc = []
# "Non-searchable PDFs" => "mime-type:application/pdf AND NOT content:*"
exc << 'Non-searchable PDFs' if TYPE == 'application/pdf' && $current_item.get_text_object.to_string.strip.empty?
# "Text Updated" => "modifications:text_updated"
exc << 'Text Updated' if $current_item.matches_search('modifications:text_updated')
# "Bad Extension" => "flag:irregular_file_extension"
# original extension is not empty and does not match corrected
exc << 'Bad Extension' if !$current_item.get_original_extension.empty? && ($current_item.get_original_extension != $current_item.get_corrected_extension)
# "Unrecognised" => "kind:unrecognised"
exc << 'Unrecognised' if KIND == 'unrecognised'
# "Empty" => "mime-type:application/x-empty"
exc << 'Empty' if TYPE == 'application/x-empty'
# "Decrypted" => "flag:decrypted"
exc << 'Decrypted' if $current_item.matches_search('flag:decrypted')
# "Deleted" => "flag:deleted"
exc << 'Deleted' if $current_item.is_deleted
# "Digest Mismatch" => "flag:digest_mismatch"
exc << 'Digest Mismatch' if $current_item.matches_search('flag:digest_mismatch')
# "Text Stripped" => "flag:text_stripped"
exc << 'Text Stripped' if $current_item.matches_search('flag:text_stripped')
# "Text Not Indexed" => "flag:text_not_indexed"
exc << 'Text Not Indexed' if $current_item.matches_search('flag:text_not_indexed')
# "Licence Restricted" => "flag:licence_restricted"
exc << 'Licence Restricted' if $current_item.matches_search('flag:licence_restricted')
# "Not Processed" => "flag:not_processed"
exc << 'Not Processed' if $current_item.matches_search('flag:not_processed')
# "Partially Processed" => "flag:partially_processed"
exc << 'Partially Processed' if $current_item.matches_search('flag:partially_processed')
# "Text Not Processed" => "flag:text_not_processed"
exc << 'Text Not Processed' if $current_item.matches_search('flag:text_not_processed')
# "Images Not Processed" => "flag:images_not_processed"
exc << 'Images Not Processed' if $current_item.matches_search('flag:images_not_processed')
# "Reloaded" => "flag:reloaded"
exc << 'Reloaded' if $current_item.matches_search('flag:reloaded')
# "Poisoned" => "flag:poison"
exc << 'Poisoned' if $current_item.matches_search('flag:poison')
# "Slack Space" => "flag:slack_space"
exc << 'Slack Space' if $current_item.matches_search('flag:slack_space')
# "Unallocated Space" => "flag:unallocated_space"
exc << 'Unallocated Space' if $current_item.matches_search('flag:unallocated_space')
# "Slack Space" => "flag:slack_space"
exc << 'Slack Space' if $current_item.matches_search('flag:slack_space')
# "Carved" => "flag:carved"
exc << 'Carved' if $current_item.matches_search('flag:carved')
# "Deleted File - All Blocks Available" => "flag:fully_recovered"
exc << 'Deleted File - All Blocks Available' if $current_item.matches_search('flag:fully_recovered')
# "Deleted File - Some Blocks Available" => "flag:partially_recovered"
exc << 'Deleted File - Some Blocks Available' if $current_item.matches_search('flag:partially_recovered')
# "Deleted File - Metadata Recovered" => "flag:metadata_recovered"
exc << 'Deleted File - Metadata Recovered' if $current_item.matches_search('flag:metadata_recovered')
# "Hidden Stream" => "flag:hidden_stream"
exc << 'Hidden Stream' if $current_item.matches_search('flag:hidden_stream')
# "Encrypted" => "encrypted:1"
# "Unsupported Items" => "NOT flag:encrypted AND has-embedded-data:0 AND ( ( has-text:0 AND has-image:0 AND NOT flag:not_processed AND NOT kind:multimedia AND NOT mime-type:application/vnd.ms-shortcut AND NOT mime-type:application/x-contact AND NOT kind:system AND NOT mime-type:( application/vnd.apache-error-log-entry OR application/vnd.git-logstash-log-entry OR application/vnd.linux-syslog-entry OR application/vnd.logstash-log-entry OR application/vnd.ms-iis-log-entry OR application/vnd.ms-windows-event-log-record OR application/vnd.ms-windows-event-logx-record OR application/vnd.ms-windows-setup-api-win7-win8-log-boot-entry OR application/vnd.ms-windows-setup-api-win7-win8-log-section-entry OR application/vnd.ms-windows-setup-api-xp-log-entry OR application/vnd.squid-access-log-entry OR application/vnd.tcpdump.record OR application/vnd.tcpdump.tcp.stream OR application/vnd.tcpdump.udp.stream OR application/vnd.twitter-logstash-log-entry OR application/x-pcapng-entry OR filesystem/x-linux-login-logfile-record OR filesystem/x-ntfs-logfile-record OR server/dropbox-log-event OR text/x-common-log-entry OR text/x-log-entry ) AND NOT kind:log AND NOT mime-type:application/vnd.ms-exchange-stm ) OR mime-type:application/vnd.lotus-notes )"
# "Corrupted" => "properties:FailureDetail AND NOT encrypted:1"
# "Corrupted Container" => "properties:FailureDetail AND encrypted:0 AND has-text:0 AND ( has-embedded-data:1 OR kind:container OR kind:database )"
# "Unsupported Container" => "kind:( container OR database ) AND encrypted:0 AND has-embedded-data:0 AND NOT flag:partially_processed AND NOT flag:not_processed AND NOT properties:FailureDetail"
if $current_item.is_encrypted
  exc << 'Encrypted'
else
  exc << 'Unsupported Items' if !HAS_EMBEDDED_DATA && ((!HAS_TEXT && $current_item.matches_search('has-image:0') && !exc.include?('Not Processed') && !%w[multimedia system log].include?(KIND) && !UNSUPPORTED_TYPES.include?(TYPE)) || TYPE == 'application/vnd.lotus-notes')
  if PROPERTIES.key?('FailureDetail')
    exc << 'Corrupted'
    exc << 'Corrupted Container' if !HAS_TEXT && (HAS_EMBEDDED_DATA || %w[container database].include?(KIND))
  elsif %w[container database].include?(KIND) && !HAS_EMBEDDED_DATA && (exc & ['Partially Processed', 'Not Processed']).empty?
    exc << 'Unsupported Container'
  end
end

exc.sort.join(DELIMITER)
