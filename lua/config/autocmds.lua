-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Set conceallevel to 1 for the Obsidian UI
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt.conceallevel = 1
  end,
})

-- toogle auto_cmp
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

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "c", "cpp", "h", "hpp" },
  callback = function()
    vim.b.autoformat = false
  end,
})

-- Turn off paste mode when leaving insert
-- vim.api.nvim_create_autocmd("InsertLeave", {
-- 	pattern = "*",
-- 	command = "set nopaste",
-- })
