# This file re-opens some standard Ruby classes and extends them with useful methods
class Numeric
	SIZE_BASE_UNIT = 1024.0

	# Converts numeric self from bytes to gigabytes
	def to_tb(decimal_places=3)
		gb_f = self.to_f / (SIZE_BASE_UNIT ** 4)
		if decimal_places == 0
			return gb_f.to_i
		else
			return gb_f.round(decimal_places)
		end
	end

	# Converts numeric self from bytes to gigabytes
	def to_gb(decimal_places=3)
		gb_f = self.to_f / (SIZE_BASE_UNIT ** 3)
		if decimal_places == 0
			return gb_f.to_i
		else
			return gb_f.round(decimal_places)
		end
	end
	# Converts numeric self from bytes to megabytes
	def to_mb(decimal_places=3)
		gb_f = self.to_f / (SIZE_BASE_UNIT ** 2)
		if decimal_places == 0
			return gb_f.to_i
		else
			return gb_f.round(decimal_places)
		end
	end
	# Converts numeric self from bytes to kilobytes
	def to_kb(decimal_places=3)
		gb_f = self.to_f / (SIZE_BASE_UNIT)
		if decimal_places == 0
			return gb_f.to_i
		else
			return gb_f.round(decimal_places)
		end
	end
	# Converts numeric self to string with most sensical size
	def to_filesize(decimal_places=3)
		if self >= (SIZE_BASE_UNIT.to_i ** 4)
			return "#{self.to_tb(decimal_places).with_commas} TB"
		elsif self >= (SIZE_BASE_UNIT.to_i ** 3)
			return "#{self.to_gb(decimal_places).with_commas} GB"
		elsif self >= (SIZE_BASE_UNIT.to_i ** 2)
			return "#{self.to_mb(decimal_places).with_commas} MB"
		elsif self >= (SIZE_BASE_UNIT.to_i)
			return "#{self.to_kb(decimal_places).with_commas} KB"
		else
			return "#{self.with_commas} B"
		end
	end
	# Converts a number representing seconds elapsed into a string
	# 65 seconds becomes "00:01:05"
	def to_elapsed
		Time.at(self).gmtime.strftime("%H:%M:%S")
	end
end

class Integer
	# Converts an integer to a comma formatted string
	# 1337 becomes "1,337"
	def with_commas
		return self.to_s.reverse.gsub(/...(?=.)/,'\&,').reverse
	end
end

class Float
	# Converts a float to a comma formatted string
	# 1337.14159 becomes "1,337.14159"
	def with_commas
		parts = self.to_s.split('.')
		parts[0] = parts[0].to_s.reverse.gsub(/...(?=.)/,'\&,').reverse
		return parts.join(".")
	end
end

mime_type = $current_item.getType.getName
if mime_type != "filesystem/directory"
	return ""
else
	descendants = $current_item.getDescendants
	physical_file_descendants = descendants.select{|d| d.isPhysicalFile}
	file_size_sum = physical_file_descendants.inject(0){|sum,d| sum += d.getFileSize}
	return file_size_sum.to_filesize
end