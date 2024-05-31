return {
	-- Norminette integration for 42 students
	{
		"hardyrafael17/norminette42.nvim",
		config = function()
			local norminette = require("norminette")
			norminette.setup({
				runOnSave = true,
				maxErrorsToShow = 5,
				active = true,
			})
		end,
	},
	-- 42 header integration for 42 students
	{
		"42Paris/42header", -- 42 header
	},
}
