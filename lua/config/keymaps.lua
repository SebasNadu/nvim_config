-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap
-- local opts = { noremap = true, silent = true }

keymap.set("n", "<leader>r", function()
  require("utils.hsl").replaceHexWithHSL()
end, { desc = "Replace hex with HSL" })

keymap.set("n", "<leader>R", function()
  require("utils.hsl").replaceHSLWithHex()
end, { desc = "Replace HSL with hex" })

keymap.set("n", "x", '"_x') -- delete without yanking
keymap.set("n", "J", "mzJ`z", { desc = "Join lines without adding spaces" }) -- join lines without adding spaces
keymap.set("n", "M-;", "$a;<Esc>", { desc = "Add semicolon at the end of the line" }) -- quick semi

keymap.set("n", "<M-a>", "gg<S-v>G", { desc = "Select all" })
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
keymap.set("n", "<leader>tc", "<cmd>ToggleAutoComplete<cr>", { desc = "Toggle Autocomplete" })
