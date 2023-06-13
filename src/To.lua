return function(refState, allPages)
	return function(newPageName: string)
		assert(allPages:get()[newPageName], `Page "{newPageName}" not defined.`)
		refState:set(newPageName)
	end
end
