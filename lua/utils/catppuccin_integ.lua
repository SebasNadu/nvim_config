local mocha = require("catppuccin.palettes").get_palette("mocha")

return {
	{
		aerial = true,
		alpha = true,
		cmp = true,
		dashboard = true,
		flash = true,
		gitsigns = true,
		headlines = true,
		illuminate = {
			enabled = true,
			lsp = false,
		},
		indent_blankline = {
			enabled = true,
			scope_color = mocha.pink,
			colored_indent_levels = false,
		},
		leap = true,
		lsp_trouble = true,
		mason = true,
		markdown = true,
		mini = {
			enabled = true,
			indentscope_color = mocha.pink,
		},
		native_lsp = {
			enabled = true,
			virtual_text = {
				errors = { "italic" },
				hints = { "italic" },
				warnings = { "italic" },
				information = { "italic" },
			},
			underlines = {
				errors = { "underline" },
				hints = { "underline" },
				warnings = { "underline" },
				information = { "underline" },
			},
			inlay_hints = {
				background = false,
			},
		},
		navic = {
			enabled = true,
			custom_bg = "lualine",
		},
		neotest = true,
		neotree = true,
		noice = true,
		notify = true,
		semantic_tokens = true,
		telescope = {
			enabled = true,
			-- style = "nvchad"
		},
		treesitter = true,
		treesitter_context = true,
		which_key = true,
		bufferline = true,
		harpoon = true,
		neogit = true,
		dap = true,
		dap_ui = true,
		ufo = true,
		octo = true,
	},
}
