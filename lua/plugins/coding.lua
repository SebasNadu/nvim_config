return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-emoji" },
    opts = function(_, opts)
      table.insert(opts.sources, { name = "emoji" })
      opts.experimental = { ghost_text = false }
      opts.completion = {
        autocomplete = false,
      }

      local cmp = require("cmp")
      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<CR>"] = function(fallback)
          cmp.abort()
          fallback()
        end,
        ["<M-n>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
      })
    end,
  },
}
