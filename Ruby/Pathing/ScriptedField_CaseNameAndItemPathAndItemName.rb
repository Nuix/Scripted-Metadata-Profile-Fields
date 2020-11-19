pieces = $current_item.getLocalisedPathNames
pieces = pieces.to_a.unshift($current_item.getCaseName)
return pieces.join("/")