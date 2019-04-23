pieces = []
pieces += $current_item.getLocalisedPathNames
pieces << $current_item.getLocalisedName
return pieces.join("/")