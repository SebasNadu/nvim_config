local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Increment/decrement
-- keymap.set("n", "+", "<C-a>", { desc = "Increment number under cursor" })
-- keymap.set("n", "-", "<C-x>", { desc = "Decrement number under cursor" })
-- Disable continuations
-- keymap.set("n", "<Leader>o", "o<Esc>^Da", opts)
-- keymap.set("n", "<Leader>O", "O<Esc>^Da", opts)

-- tabs explorer
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)

keymap.set("n", "<leader>=", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height

keymap.set("n", "<leader>r", function()
	require("utils.hsl").replaceHexWithHSL()
end, { desc = "Replace hex with HSL" })

keymap.set("n", "<leader>R", function()
	require("utils.hsl").replaceHSLWithHex()
end, { desc = "Replace HSL with hex" })

-- Better indent
keymap.set("v", "<", "<gv", { desc = "Indent left" })
keymap.set("v", ">", ">gv", { desc = "Indent right" })
-- Better viewing
keymap.set("n", "n", "nzzzv", { desc = "Select pattern forwards" }) -- select pattern forwards, search occurrences, center screen
keymap.set("n", "N", "Nzzzv", { desc = "Select pattern backwards" }) -- select pattern backwards, search occurrences, center screen
keymap.set("n", "g,", "g,zvzz") -- jump backwards, centter screen
keymap.set("n", "g;", "g;zvzz") -- jump forwards, center screen
-- copy to clipboaCd
keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Copy to clipboard" })
keymap.set("n", "<leader>Y", [["+Y]], { desc = "Copy to clipboard the whole line" })
-- keymap.set("x", "<leader>p", [["_dP]]) -- paste in a block without overwriting the clipboard
keymap.set("n", "x", '"_x') -- delete without yanking
keymap.set("n", "J", "mzJ`z", { desc = "Join lines without adding spaces" }) -- join lines without adding spaces
keymap.set("n", "M-;", "$a;<Esc>", { desc = "Add semicolon at the end of the line" }) -- quick semi
-- smart replace
keymap.set(
	"n",
	"<leader>rr",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "Replace world over cursor" }
) -- replace word under cursor
-- vim.keymap.set("v", "<leader><C-r>", '"hy:%s/<C-r>h//g<left><left>') -- Replace all instances of highlighted words
-- Scrolling
keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Move down half page" }) -- move down half a page
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Move up half page" }) -- move up half a page
-- Delete a word backwards
keymap.set("n", "dw", 'vb"_d', { desc = "Delete a word backwards" })
-- Select all
keymap.set("n", "<M-a>", "gg<S-v>G", { desc = "Select all" })
keymap.set("n", "<C-a>", "")

-- Save with root permission (not working for now)
--vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})
-- Moving text
-- keymap.set("n", "<leader>k", ":m .-2<CR>==", { desc = "Move up the current line" })
-- keymap.set("n", "<leader>j", ":m .+1<CR>==", { desc = "Move down the current line" })
-- keymap.set("v", "J", ":m '>+2<CR>gv=gv", { desc = "Move the whole selection down" })
-- keymap.set("v", "K", ":m '<-1<CR>gv=gv", { desc = "Move the whole selection up" })

-- Insert blank line
keymap.set("n", "<leader><CR>", "o<Esc>", { desc = "Insert blank line below in normal mode" })
keymap.set("n", "<leader><bs>", "O<Esc>", { desc = "Insert blank line above in normal mode" })
-- Auto indent on new line in insert mode (like in VSCode)
keymap.set("n", "i", function()
	if #vim.fn.getline(".") == 1 then
		return [["_cc]]
	else
		return "i"
	end
end, { expr = true })
-- Reset default keymaps for Move top, middle and bottom of screen
keymap.set("n", "H", "H")
keymap.set("n", "L", "L")

keymap.set("n", "<leader>tc", "<cmd>ToggleAutoComplete<cr>", { desc = "Toggle Autocomplete" })
