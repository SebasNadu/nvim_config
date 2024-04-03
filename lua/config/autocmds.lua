-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
	pattern = "*",
	command = "set nopaste",
})

-- Disable the concealing in some file formats
-- The default conceallevel is 3 in LazyVim
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "json", "jsonc" },
	callback = function()
		vim.opt.conceallevel = 0
	end,
})

-- Set conceallevel to 1 for the Obsidian UI
vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	callback = function()
		vim.opt.conceallevel = 1
	end,
})

local cmp_enabled = true
vim.api.nvim_create_user_command("ToggleAutoComplete", function()
	if cmp_enabled then
		require("cmp").setup.buffer({ enabled = false })
		cmp_enabled = false
	else
		require("cmp").setup.buffer({ enabled = true })
		cmp_enabled = true
	end
end, {})
