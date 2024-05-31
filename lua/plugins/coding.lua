return {
	{
		"hrsh7th/nvim-cmp",
		dependencies = { "hrsh7th/cmp-emoji" },
		opts = function(_, opts)
			local cmp = require("cmp")
			table.insert(opts.sources, { name = "emoji" })
			opts.mapping = vim.tbl_extend("force", opts.mapping, {
				["<CR>"] = function(fallback)
					cmp.abort()
					fallback()
				end,
				["<C-L>"] = cmp.mapping.confirm({ select = true }),
			})
		end,
	},
}
