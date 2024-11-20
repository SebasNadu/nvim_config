return {
  {
    "olrtg/nvim-emmet",
    config = function()
      vim.keymap.set({ "n", "v" }, "<leader>xe", require("nvim-emmet").wrap_with_abbreviation)
    end,
  },
  -- Norminette integration for 42 students
  {
    "hardyrafael17/norminette42.nvim",
    enabled = false,
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
