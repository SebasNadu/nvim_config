vim.g.mapleader = " "

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

vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

vim.opt.number = true
vim.opt.title = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.hlsearch = true
vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 2
vim.opt.expandtab = true
vim.opt.scrolloff = 10
-- vim.opt.shell = "fish"
vim.opt.shell = "zsh"
vim.opt.backupskip = { "/tmp/*", "/private/tmp/*" }
vim.opt.inccommand = "split"
vim.opt.ignorecase = true -- Case insensitive searching UNLESS /C or capital in search
vim.opt.smarttab = false -- Makes tabbing smarter will realize you have 2 vs 4
vim.opt.expandtab = false -- Converts tabs to spaces
vim.opt.breakindent = true
vim.opt.wrap = false -- No Wrap lines
vim.opt.path:append({ "**" }) -- Finding files - Search down into subfolders
vim.opt.wildignore:append({ "*/node_modules/*" })
vim.opt.splitbelow = true -- Put new windows below current
vim.opt.splitright = true -- Put new windows right of current
vim.opt.splitkeep = "cursor"
vim.opt.mouse = "a"
vim.opt.scrolloff = 10 -- Lines of context
vim.opt.backspace = { "start", "eol", "indent" } -- Make backspace behave like every other editor ever
vim.opt.joinspaces = false -- No double spaces with join after a dot

vim.opt.colorcolumn = "80" -- Line length marker
-- vim.opt.backspace = { "start", "eol", "indent" } -- Make backspace behave like every other editor ever
vim.opt.backupskip = { "/tmp/*", "/private/tmp/*" } -- Ignore these files for backup
vim.opt.wildignore:append({ "*/node_modules/*" }) -- Ignore node_modules
vim.opt.swapfile = false -- No swapfile
vim.opt.backup = false -- No backup
vim.opt.undofile = true -- Enable undo file
vim.opt.undodir = os.getenv("HOME") .. "/.config/nvim/undodir" -- Set undodir

-- Undercurl
vim.opt.spell = true
vim.opt.spelllang = { "en_us" }
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])
-- For formatting concealment features on Obsidian

-- Add asterisks in block comments
vim.opt.formatoptions:append({ "r" })

vim.cmd([[au BufNewFile,BufRead *.astro setf astro]])
vim.cmd([[au BufNewFile,BufRead Podfile setf ruby]])

if vim.fn.has("nvim-0.8") == 1 then
	vim.opt.cmdheight = 0
end
-- for auto-session plugin
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
-- for Obsidian plugin
vim.opt.conceallevel = 2
