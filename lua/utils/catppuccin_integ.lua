local mocha = require("catppuccin.palettes").get_palette("mocha")

return {
	{
		aerial = true,
		-- barbecue = {
		--   dim_dirname = true, -- directory name is dimmed by default
		--   bold_basename = true,
		--   dim_context = false,
		--   alt_background = false,
		-- },
		bufferline = true,
		dashboard = true,
		flash = true,
		gitsigns = true,
		harpoon = true,
		indent_blankline = {
			enabled = true,
			scope_color = mocha.pink,
			colored_indent_levels = false,
		},
		markdown = true,
		mason = true,
		mini = {
			enabled = true,
			indentscope_color = mocha.pink,
		},
		neotree = true,
		neogit = true,
		neotest = true,
		noice = true,
		cmp = true,
		dap = true,
		dap_ui = true,
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
			custom_bg = "NONE",
		},
		notify = true,
		semantic_tokens = true,
		treesitter_context = true,
		treesitter = true,
		ufo = true,
		octo = true,
		telescope = {
			enabled = true,
			-- style = "nvchad"
		},
		lsp_trouble = true,
		illuminate = {
			enabled = true,
			lsp = false,
		},
		which_key = true,
	},
}
