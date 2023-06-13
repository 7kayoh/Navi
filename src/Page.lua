return function(refState, allPages)
	local pageKey = {}
	pageKey.type = "SpecialKey"
	pageKey.kind = "Page"
	pageKey.stage = "observer"

	function pageKey:apply(pageName: string, applyTo: Instance, cleanupTasks)
		assert(not allPages:get()[pageName], `Page "{pageName}" already defined.`)
		local newAllPages = allPages:get()
		newAllPages[pageName] = applyTo
		allPages:set(newAllPages)

		table.insert(cleanupTasks, function()
			local newAllPages = allPages:get()
			newAllPages[pageName] = nil
			allPages:set(newAllPages)
		end)
	end

	return pageKey
end
