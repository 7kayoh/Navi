local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Fusion = require(ReplicatedStorage:FindFirstChild("Fusion", true))

return function()
	local currentPage = Fusion.Value("")
	local pages = Fusion.Value({})

	return {
		Page = require(script.Page)(currentPage, pages),
		To = require(script.To)(currentPage, pages),
		Canvas = require(script.Canvas)(currentPage, pages),
	}
end
