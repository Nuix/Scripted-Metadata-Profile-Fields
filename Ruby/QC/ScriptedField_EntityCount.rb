entity_type = 'country'
entities = $current_item.get_entities(entity_type)
return nil if entities.empty?

entity_map = Hash.new(0)
text_object = $current_item.get_text_object
buffered_reader = nil
begin
  text_object.using_text do |reader|
    buffered_reader = java.io.BufferedReader.new(reader)
    loop do
      line = buffered_reader.read_line
      break if line.nil?

      entities.each do |e|
        # tally occurences of entity
        entity_map[e] += line.scan(e).length
      end
    end
  end
rescue Exception => e
  return "ERROR with item text: #{e.message}\n#{e.backtrace.join("\n")}"
ensure
  buffered_reader&.close
end

entity_map.map { |k, v| "\"#{k}\": #{v}" }.join('; ')
