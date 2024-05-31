return {
	{
		"craftzdog/solarized-osaka.nvim",
		lazy = true,
		opts = function()
			return {
				transparent = true,
			}
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = true,
		opts = function()
			local opts = {}
			local THEME_NAME = "gruvboxnew"

			local colors_overrides = THEME_NAME ~= "catppuccin" and require("colorschemas." .. THEME_NAME) or {}
			opts.color_overrides = colors_overrides
			-- flavour = "macchiato", -- latte, frappe, macchiato, mocha
			opts.background = {
				light = "latte",
				dark = "mocha",
			}
			opts.transparent_background = true
			opts.show_end_of_buffer = true -- show the '~' characters after the end of buffer
			opts.term_colors = false -- set terminal color
			opts.dim_inactive = {
				enabled = false,
				shade = "dark",
				percentage = 0.15,
			}
			opts.no_italic = false -- Force no italic
			opts.no_bold = false -- Force no bold
			opts.no_underline = false -- Force no underline

			local highlights = require("utils.catppuccin_hl")
			opts.custom_highlights = highlights.custom_highlights
			opts.styles = highlights.styles
			opts.highlight_overrides = highlights.highlight_overrides

			opts.integrations = require("utils.catppuccin_integ")

			return opts
		end,
		config = function(_, opts)
			require("catppuccin").setup(opts)
			vim.cmd.colorscheme("catppuccin")
		end,
	},
}
