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
	{
		"echasnovski/mini.comment",
		enabled = false,
	},
	{
		"echasnovski/mini.bracketed",
		event = "BufReadPost",
		-- config = function()
		--   local bracketed = require("mini.bracketed")
		--   bracketed.setup({
		--     file = { suffix = "" },
		--     window = { suffix = "" },
		--     quickfix = { suffix = "" },
		--     yank = { suffix = "" },
		--     treesitter = { suffix = "n" },
		--   })
		-- end,
	},
	{
		"simrat39/symbols-outline.nvim",
		keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
		cmd = "SymbolsOutline",
		opts = {
			position = "right",
		},
	},
}
