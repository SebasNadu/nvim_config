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

vim.opt.shell = "/bin/zsh"

vim.opt.cmdheight = 1 -- Command line height
vim.opt.laststatus = 3 -- Always show status line
vim.opt.scrolloff = 10 -- Lines of context
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

vim.g.python3_host_prog = vim.fn.expand("~/.pyenv/versions/nvim-env/bin/python")
vim.g.vimtex_view_method = "zathura"
vim.g.vimtex_compiler_method = "latexrun"
