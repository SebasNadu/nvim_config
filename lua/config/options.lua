-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Config for 42Berlin
-- if
-- 	vim.fn.expand("%:e") == "c" or vim.fn.expand("%:e") == "h"
-- 	-- or vim.fn.expand("%:e") == "cpp"
-- 	-- or vim.fn.expand("%:e") == "hpp"
-- then
-- 	vim.opt.shiftwidth = 4 -- 4 spaces for indent width
-- 	vim.opt.tabstop = 4 -- 4 spaces for tab width
-- else
-- 	vim.opt.shiftwidth = 2 -- 2 spaces for indent width
-- 	vim.opt.tabstop = 2 -- 2 spaces for tab width (prettier default)
-- end

vim.opt.smarttab = false -- Makes tabbing smarter will realize you have 2 vs 4
vim.opt.expandtab = false -- Converts tabs to spaces
vim.opt.path:append({ "**" }) -- Finding files - Search down into subfolders
vim.opt.colorcolumn = "80" -- Line length marker
vim.opt.swapfile = false -- No swapfile
vim.opt.backup = false -- No backup
vim.opt.undofile = true -- Enable undo file
vim.opt.undodir = os.getenv("HOME") .. "/.config/nvim/undodir" -- Set undodir
vim.opt.spell = true
-- for auto-session plugin
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

-- LSP Server to use for Python.
-- Set to "basedpyright" to use basedpyright instead of pyright.
-- vim.g.lazyvim_python_lsp = "pyright"
-- vim.g.lazyvim_python_ruff = "ruff_lsp"
