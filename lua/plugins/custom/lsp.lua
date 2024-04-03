return {
  -- Norminette integration for 42 students
  {
    "hardyrafael17/norminette42.nvim",
    config = function()
      require("norminette").setup({
        active = true,
      })
    end,
  },
  -- 42 header integration for 42 students
  {
    "42Paris/42header", -- 42 header
  },
}
