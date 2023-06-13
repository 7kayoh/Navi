local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Fusion = require(ReplicatedStorage:FindFirstChild("Fusion", true))

return function(refState, allPages)
	return function(props)
		local renderedPage = Fusion.Value(nil)
		Fusion.Observer(refState):onChange(function()
			renderedPage:set(allPages:get()[refState:get()])
		end)

		return Fusion.Hydrate(Fusion.New("Frame")({
			[Fusion.Children] = renderedPage,
		}))
	end
end
