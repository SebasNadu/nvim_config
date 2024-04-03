return {
  -- Autoclose and autorename html tags with treesitter
  {
    "windwp/nvim-ts-autotag",
    -- enabled = false,
    dependencies = "nvim-treesitter/nvim-treesitter",
    lazy = true,
    event = "VeryLazy",
    config = function()
      require("nvim-ts-autotag").setup({})
    end,
  },
}
