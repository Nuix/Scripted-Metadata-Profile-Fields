# Identifies "parent" documents that contain embedded content (e.g. a Word document
# with an embedded Excel spreadsheet or PDF), as distinct from email attachments.
#
# How it works:
#   1. Fast break - if the current item's MIME type is not in PARENT_MIME_TYPES,
#      yield false immediately without inspecting any children.
#   2. Otherwise, inspect the current item's children (or all descendants if
#      RECURSE is true). If any child's MIME type is in EMBEDDED_MIME_TYPES,
#      yield true; otherwise yield false.
#
# Because only document/spreadsheet/presentation/PDF parents (PARENT_MIME_TYPES)
# are ever checked, emails are never evaluated as parents, so their attachments
# are not counted as embedded content. The definition of what counts as embedded
# content is driven entirely by the two configurable lists below.
#
# Return value: this field returns an actual boolean (true / false), not a string.
#   * When displayed in a metadata profile column or metadata export, Nuix formats
#     the value via MetadataItem.evaluate(Item) (a String), so it renders as
#     "true" / "false" text there.
#   * A companion script can retrieve the RAW boolean via
#     MetadataItem.evaluateUnformatted(Item), which returns the underlying Object
#     (here a Boolean). That script can then store it as real boolean custom
#     metadata with ItemCustomMetadataMap.putBoolean, making it searchable via
#     boolean-custom-metadata:<field>:true. Returning a real boolean (rather than
#     a string) is what lets evaluateUnformatted surface a true Boolean type.

#===============================================================================
# Configuration - edit these lists to tailor behaviour
#===============================================================================

# Only items whose MIME type matches one of these are checked for embedded content.
# MIME strings are the "Query String" values from the Nuix Engine 100.20 file-types
# reference (the same values used with the mime-type: search field).
#
# Matching (see matches_any? below for full detail):
#   * A plain entry is an EXACT match, e.g. "application/pdf".
#   * An entry ending in a single trailing "*" is a PREFIX match, e.g.
#     "application/vnd.ms-word*" also covers "...ms-word-pre-ole2" and "...ms-word+xml".
#   * The "*" is ONLY special as the final character. It is NOT a wildcard and cannot
#     be used mid-string for glob-style matching.
PARENT_MIME_TYPES = [
	# Microsoft Word (legacy .doc family via prefix + modern .docx family)
	"application/vnd.ms-word*",
	"application/vnd.openxmlformats-officedocument.wordprocessingml.document",
	# Microsoft Excel (legacy .xls family via prefix + modern .xlsx family + binary .xlsb)
	"application/vnd.ms-excel*",
	"application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
	"application/vnd.openxmlformats-officedocument.spreadsheet.binary",
	# Microsoft PowerPoint (legacy .ppt family + modern .pptx family)
	"application/vnd.ms-powerpoint",
	"application/vnd.openxmlformats-officedocument.presentationml.presentation",
	# PDF
	"application/pdf",
	# OpenDocument (uncomment if desired)
	# "application/vnd.oasis.opendocument.text",
	# "application/vnd.oasis.opendocument.spreadsheet",
	# "application/vnd.oasis.opendocument.presentation",
]

# A parent (matching PARENT_MIME_TYPES) is flagged "true" if it has at least one
# child (or descendant, when RECURSE is true) whose MIME type matches one of these.
# Same matching rules as above (exact, or prefix when the entry ends in "*").
EMBEDDED_MIME_TYPES = [
	# Embedded spreadsheets
	"application/vnd.ms-excel*",
	"application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
	"application/vnd.openxmlformats-officedocument.spreadsheet.binary",
	# Embedded word processing documents
	"application/vnd.ms-word*",
	"application/vnd.openxmlformats-officedocument.wordprocessingml.document",
	# Embedded presentations
	"application/vnd.ms-powerpoint",
	"application/vnd.openxmlformats-officedocument.presentationml.presentation",
	# Embedded PDFs
	"application/pdf",
	# Embedded images (uncomment if desired - trailing "*" prefix-matches all image/* types)
	"image/*",
]

# Whether to inspect the entire subtree (all descendants) or only immediate children.
#
# Recommended: true (inspect all descendants).
#
# Embedded content is frequently NOT a direct child of the parent document. Nuix
# often materializes intermediate structure between a document and its embedded
# media - for example an embedded package / OLE storage / "folder"-like container
# node, with the actual embedded Excel, PDF or image sitting one or more levels
# BELOW it. With immediate-children-only (false), that intermediate node would be
# the only thing inspected (and it won't match EMBEDDED_MIME_TYPES), so real
# embedded content would be missed.
#
#   true  -> current_item.getDescendants : walks the whole subtree, catching
#            embedded media no matter how many wrapper/container layers are between
#            the parent and the target. This is the safe default.
#   false -> current_item.getChildren    : only the immediate children. Faster, but
#            can under-report when embedded content is nested below a container node.
RECURSE = true

# When true, the field returns a human-readable diagnostic STRING describing every
# decision point (parent MIME, whether it matched, how many children were inspected,
# each child's MIME and whether it matched) instead of the boolean result. Use this
# to understand why an item is/ isn't being flagged, then set back to false.
DEBUG = false

#===============================================================================
# Logic - normally no need to edit below this line
#===============================================================================

# Returns true if mime matches any entry in list.
#
# Matching rule for each list entry:
#   * If the entry ends with a single trailing "*", it is a PREFIX match: the "*"
#     is stripped and the child MIME must start with the remaining text.
#       e.g. "application/vnd.ms-word*" matches "application/vnd.ms-word",
#            "application/vnd.ms-word-pre-ole2" and "application/vnd.ms-word+xml".
#   * Otherwise the entry is an EXACT match: the child MIME must equal it exactly.
#
# IMPORTANT: This is NOT wildcard support. The "*" is only recognised as a special
# character when it is the LAST character of an entry, where it means "prefix match".
# A "*" anywhere else (e.g. "app*/pdf" or "application/*ms-word") is treated as a
# literal asterisk character and will almost never match anything. You cannot use
# "*" for arbitrary glob-style patterns - trailing "*" (prefix) or nothing (exact)
# are the only two behaviours.
def matches_any?(mime, list)
	return false if mime.nil?
	list.any? do |entry|
		if entry.end_with?("*")
			prefix = entry[0..-2]  # drop the trailing "*"
			mime.start_with?(prefix)
		else
			mime == entry
		end
	end
end

# Determine the current item's MIME type
parent_mime = nil
type_error = nil
begin
	item_type = current_item.getType
	parent_mime = item_type.getName unless item_type.nil?
rescue Exception => ex
	type_error = ex.message
end

if type_error
	return "DEBUG | parent GUID: #{current_item.getGuid} | ERROR reading parent type: #{type_error}" if DEBUG
	return false
end

# Fast break: not a container type we care about
parent_matched = matches_any?(parent_mime, PARENT_MIME_TYPES)
unless parent_matched
	if DEBUG
		return "DEBUG | parent GUID: #{current_item.getGuid} | parent MIME: #{parent_mime.inspect} | " \
		       "parent in PARENT_MIME_TYPES? false -> fast break, result=false"
	end
	return false
end

# Gather the items to inspect
children = RECURSE ? current_item.getDescendants : current_item.getChildren
children = [] if children.nil?
children = children.to_a

# Inspect children, collecting diagnostics
result = false
child_notes = []
children.each do |child|
	begin
		child_type = child.getType
		if child_type.nil?
			child_notes << "[no type] guid=#{child.getGuid rescue '?'}" if DEBUG
			next
		end
		child_mime = child_type.getName
		matched = matches_any?(child_mime, EMBEDDED_MIME_TYPES)
		child_notes << "#{child_mime} => #{matched}" if DEBUG
		if matched
			result = true
			break unless DEBUG  # in debug mode, keep listing all children
		end
	rescue Exception => ex
		child_notes << "[error: #{ex.message}]" if DEBUG
		next
	end
end

if DEBUG
	scope = RECURSE ? "descendants" : "children"
	return "DEBUG | parent GUID: #{current_item.getGuid} | parent MIME: #{parent_mime.inspect} | " \
	       "parent matched: true | #{scope} inspected: #{children.size} | " \
	       "child matches: [#{child_notes.join(" ; ")}] | result=#{result}"
end

return result
