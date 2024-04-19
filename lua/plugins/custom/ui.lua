return {
	-- filename ui on the top right
	{
		"b0o/incline.nvim",
		dependencies = { "craftzdog/solarized-osaka.nvim" },
		event = "BufReadPre",
		priority = 1200,
		config = function()
			local colors = require("solarized-osaka.colors").setup()
			require("incline").setup({
				highlight = {
					groups = {
						InclineNormal = { guibg = colors.magenta500, guifg = colors.base04 },
						InclineNormalNC = { guifg = colors.violet500, guibg = colors.base03 },
					},
				},
				window = { margin = { vertical = 0, horizontal = 1 } },
				hide = {
					cursorline = true,
				},
				render = function(props)
					local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
					if vim.bo[props.buf].modified then
						filename = "[+] " .. filename
					end

					local icon, color = require("nvim-web-devicons").get_icon_color(filename)
					return { { icon, guifg = color }, { " " }, { filename } }
				end,
			})
		end,
	},
	-- Zen mode for better focus
	{
		"folke/zen-mode.nvim",
		cmd = "ZenMode",
		opts = {
			window = {
				backdrop = 0.95,
				width = 80, -- width of the Zen window
				height = 1, -- height of the Zen window
				options = {
					signcolumn = "no", -- disable signcolumn
					number = false, -- disable number column
					relativenumber = false, -- disable relative numbers
					-- cursorline = false, -- disable cursorline
					-- cursorcolumn = false, -- disable cursor column
					-- foldcolumn = "0", -- disable fold column
					-- list = false, -- disable whitespace characters
				},
			},
			plugins = {
				options = {
					enabled = true,
					ruler = false, -- disables the ruler text in the cmd line area
					showcmd = false, -- disables the command in the last line of the screen
					-- you may turn on/off statusline in zen mode by setting 'laststatus'
					-- statusline will be shown only if 'laststatus' == 3
					laststatus = 0, -- turn off the statusline in zen mode
				},
				gitsigns = true,
				tmux = true,
				iterm = { enabled = true, font = "+2" },
			},
		},
		keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
	},
	-- Dim inactive portion of the code you are editing
	{
		"folke/twilight.nvim",
		opts = {
			dimming = {
				alpha = 0.35, -- amount of dimming
				-- we try to get the foreground from the highlight groups or fallback color
				-- color = { "Normal", "#ffffff" },
				-- term_bg = "#000000", -- if guibg=NONE, this will be used to calculate text color
				-- inactive = false, -- when true, other windows will be fully dimmed (unless they contain the same buffer)
			},
			context = 16, -- amount of lines we will try to show around the current line
		},
		config = function(_, opts)
			require("twilight").setup(opts)
		end,
		cmd = { "Twilight", "TwilightEnable", "TwilightDisable" },
	},
	-- highlight args in function calls
	{
		"m-demare/hlargs.nvim",
		event = "VeryLazy",
		enabled = false,
		opts = {
			color = "#ef9062",
			use_colorpalette = false,
			disable = function(_, bufnr)
				if vim.b.semantic_tokens then
					return true
				end
				local clients = vim.lsp.get_active_clients({ bufnr = bufnr })
				for _, c in pairs(clients) do
					local caps = c.server_capabilities
					if c.name ~= "null-ls" and caps.semanticTokensProvider and caps.semanticTokensProvider.full then
						vim.b.semantic_tokens = true
						return vim.b.semantic_tokens
					end
				end
			end,
		},
	},
	-- VS code like winbar to get LSP context
	{
		"utilyre/barbecue.nvim",
		name = "barbecue",
		enabled = false,
		version = "*",
		theme = "catppuccin-mocha",
		dependencies = {
			"neovim/nvim-lspconfig",
			"nvim-tree/nvim-web-devicons", -- optional dependency
			"SmiteshP/nvim-navic",
		},
		opts = {},
		config = function()
			vim.opt.updatetime = 200

			require("barbecue").setup({
				create_autocmd = false, -- prevent barbecue from updating itself automatically
			})

			vim.api.nvim_create_autocmd({
				"WinScrolled", -- or WinResized on NVIM-v0.9 and higher
				"BufWinEnter",
				"CursorHold",
				"InsertLeave",

				-- include this if you have set `show_modified` to `true`
				"BufModifiedSet",
			}, {
				group = vim.api.nvim_create_augroup("barbecue.updater", {}),
				callback = function()
					require("barbecue.ui").update()
				end,
			})
		end,
	},
	-- Colorize the dead column, useful to respect the 80 columns rule
	{
		"Bekaboo/deadcolumn.nvim",
		opts = function()
			-- local latte = require("catppuccin.palettes").get_palette("latte")
			local mocha = require("catppuccin.palettes").get_palette("mocha")

			local options = {
				scope = "line", --- @type string|fun(): integer
				---@type string[]|fun(mode: string): boolean
				modes = function(mode)
					return mode:find("^[ictRss\x13]") ~= nil
				end,
				blending = {
					threshold = 0.75,
					colorcode = mocha.base,
					hlgroup = { "NonText", "bg" },
				},
				warning = {
					alpha = 0.5,
					offset = 1,
					colorcode = mocha.red,
					hlgroup = { "Error", "bg" },
				},
				-- extra = {
				-- 	---@type string?
				-- 	follow_tw = nil,
				-- },
			}
			return options
		end,
		config = function(_, opts)
			require("deadcolumn").setup(opts)
		end,
	},
	-- Custom fold/unfold
	{
		{
			"kevinhwang91/nvim-ufo",
			dependencies = {
				"kevinhwang91/promise-async",
				{
					"luukvbaal/statuscol.nvim",
					config = function()
						local builtin = require("statuscol.builtin")
						require("statuscol").setup({
							relculright = true,
							segments = {
								{ text = { builtin.foldfunc }, click = "v:lua.ScFa" },
								{ text = { "%s" }, click = "v:lua.ScSa" },
								{ text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
							},
						})
					end,
				},
			},
			-- event = "VeryLazy",
			event = "BufReadPost",
			opts = {
				provider_selector = function(bufnr, filetype, buftype)
					return { "treesitter", "indent" }
				end,
				open_fold_hl_timeout = 200,
				close_fold_kinds_for_ft = { "imports", "comment" },
				preview = {
					win_config = {
						border = { "", "─", "", "", "", "─", "", "" },
						-- winhighlight = "Normal:Folded",
						winblend = 0,
					},
					mappings = {
						scrollU = "<C-u>",
						scrollD = "<C-d>",
						jumpTop = "[",
						jumpBot = "]",
					},
				},
			},
			init = function()
				vim.o.fillchars = [[eob: ,fold:,foldopen:󱙝,foldsep: ,foldclose:󰧵]]
				vim.o.foldcolumn = "1" -- '0' is not bad
				vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
				vim.o.foldlevelstart = 99
				vim.o.foldenable = true
			end,
			config = function(_, opts)
				local handler = function(virtText, lnum, endLnum, width, truncate)
					local newVirtText = {}
					local totalLines = vim.api.nvim_buf_line_count(0)
					local foldedLines = endLnum - lnum
					local suffix = ("   %d %d%%"):format(foldedLines, foldedLines / totalLines * 100)
					local sufWidth = vim.fn.strdisplaywidth(suffix)
					local targetWidth = width - sufWidth
					local curWidth = 0
					for _, chunk in ipairs(virtText) do
						local chunkText = chunk[1]
						local chunkWidth = vim.fn.strdisplaywidth(chunkText)
						if targetWidth > curWidth + chunkWidth then
							table.insert(newVirtText, chunk)
						else
							chunkText = truncate(chunkText, targetWidth - curWidth)
							local hlGroup = chunk[2]
							table.insert(newVirtText, { chunkText, hlGroup })
							chunkWidth = vim.fn.strdisplaywidth(chunkText)
							-- str width returned from truncate() may less than 2nd argument, need padding
							if curWidth + chunkWidth < targetWidth then
								suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
							end
							break
						end
						curWidth = curWidth + chunkWidth
					end
					-- local rAlignAppndx = math.max(width - 5 - curWidth - sufWidth, 0)
					-- suffix = " ⋯  " .. (" "):rep(rAlignAppndx) .. suffix
					local rAlignAppndx = math.max(math.min(vim.opt.textwidth["_value"], width - 1) - curWidth - sufWidth, 0)
					suffix = (" ⋯ "):rep(rAlignAppndx) .. suffix
					table.insert(newVirtText, { suffix, "MoreMsg" })
					return newVirtText
				end
				opts["fold_virt_text_handler"] = handler

				require("ufo").setup(opts)
			end,
		},
	},
	-- Custom cursor
	{
		"gen740/SmoothCursor.nvim",
		config = function()
			-- local latte = require("catppuccin.palettes").get_palette("latte")
			local mocha = require("catppuccin.palettes").get_palette("mocha")

			vim.api.nvim_set_hl(0, "SmoothCursor", { bg = nil, fg = mocha.blue, default = true })
			vim.api.nvim_set_hl(0, "SmoothCursorRed", { bg = nil, fg = mocha.flamingo, default = true })
			vim.api.nvim_set_hl(0, "SmoothCursorOrange", { bg = nil, fg = mocha.peach, default = true })
			vim.api.nvim_set_hl(0, "SmoothCursorYellow", { bg = nil, fg = mocha.yellow, default = true })
			vim.api.nvim_set_hl(0, "SmoothCursorGreen", { bg = nil, fg = mocha.green, default = true })
			vim.api.nvim_set_hl(0, "SmoothCursorAqua", { bg = nil, fg = mocha.sky, default = true })
			vim.api.nvim_set_hl(0, "SmoothCursorBlue", { bg = nil, fg = mocha.blue, default = true })
			vim.api.nvim_set_hl(0, "SmoothCursorPurple", { bg = nil, fg = mocha.mauve, default = true })
		-- stylua: ignore
		local matrix_chars = {
			" ｱ", " ｲ", " ｳ", " ｴ", " ｵ", " ｶ", " ｷ", " ｸ", " ｹ", " ｺ", " ｻ", " ｼ",
			" ｽ", " ｾ", " ｿ", " ﾀ", " ﾁ", " ﾂ", " ﾃ", " ﾄ", " ﾅ", " ﾆ", " ﾇ", " ﾈ",
			" ﾉ", " ﾊ", " ﾋ", " ﾌ", " ﾍ", " ﾎ", " ﾏ", " ﾐ", " ﾑ", " ﾒ", " ﾓ", " ﾔ",
			" ﾕ", " ﾖ", " ﾗ", " ﾘ", " ﾙ", " ﾚ", " ﾛ", " ﾜ", " ｦ", " ﾝ", " -", " 1",
			" 2", " 3", " 4", " 5", " 6", " 7", " 8", " 9", " 0", " .", " ･", " =",
			" *", " +", " -", " >", " <", " ○", " x", " △", " □", " ▽", }
			require("smoothcursor").setup({
				type = "matrix", -- Cursor movement calculation method, choose "default", "exp" (exponential) or "matrix".

				cursor = " ", -- Cursor shape (requires Nerd Font). Disabled in fancy mode.
				texthl = "SmoothCursor_s", -- Highlight group. Default is { bg = nil, fg = "#FFD400" }. Disabled in fancy mode.
				linehl = "SmoothCursorYellow", -- Highlights the line under the cursor, similar to 'cursorline'. "CursorLine" is recommended. Disabled in fancy mode.

				matrix = { -- Loaded when 'type' is set to "matrix"
					head = {
						cursor = matrix_chars, -- Cursor shape (requires Nerd Font). Disabled in fancy mode.
						texthl = {
							"SmoothCursorGreen",
						},
						linehl = nil, -- No line highlight for the head
					},
					body = {
						length = 7, -- Specifies the length of the cursor body
						cursor = matrix_chars,
						texthl = {
							"SmoothCursorGreen",
						},
					},
					tail = {
						cursor = nil,
						texthl = {
							"SmoothCursor",
						},
					},
					unstop = false, -- Determines if the cursor should stop or not (false means it will stop)
				},

				autostart = true, -- Automatically start SmoothCursor
				flyin_effect = "bottom", -- Choose "bottom" or "top" for flying effect
				speed = 20, -- Max speed is 100 to stick with your current position
				intervals = 20, -- Update intervals in milliseconds
				priority = 10, -- Set marker priority
				timeout = 3000, -- Timeout for animations in milliseconds
				threshold = 3, -- Animate only if cursor moves more than this many lines
				disable_float_win = true, -- Disable in floating windows
				enabled_filetypes = nil, -- Enable only for specific file types, e.g., { "lua", "vim" }
				disabled_filetypes = nil, -- Disable for these file types, ignored if enabled_filetypes is set. e.g., { "TelescopePrompt", "NvimTree" }
			})

			local autocmd = vim.api.nvim_create_autocmd

			autocmd({ "ModeChanged" }, {
				callback = function()
					local current_mode = vim.fn.mode()
					if current_mode == "n" then
						vim.fn.sign_define("smoothcursor", { text = " " })
						vim.api.nvim_set_hl(0, "SmoothCursor", { fg = mocha.blue })
					elseif current_mode == "v" then
						vim.fn.sign_define("smoothcursor", { text = " 󰅪" })
						vim.api.nvim_set_hl(0, "SmoothCursor", { fg = mocha.mauve })
					elseif current_mode == "V" then
						vim.fn.sign_define("smoothcursor", { text = " 󰊓" })
						vim.api.nvim_set_hl(0, "SmoothCursor", { fg = mocha.lavender })
					elseif current_mode == "" then
						vim.fn.sign_define("smoothcursor", { text = " 󰘖" })
						vim.api.nvim_set_hl(0, "SmoothCursor", { fg = mocha.pink })
					elseif current_mode == "i" then
						vim.fn.sign_define("smoothcursor", { text = " " })
						vim.api.nvim_set_hl(0, "SmoothCursor", { fg = mocha.green })
					elseif current_mode == "R" then
						vim.fn.sign_define("smoothcursor", { text = " 󰮯" })
						vim.api.nvim_set_hl(0, "SmoothCursor", { fg = mocha.red })
					end
				end,
			})
		end,
	},
	-- Windows animation and behavior
	{
		"anuvyklack/windows.nvim",
		dependencies = {
			"anuvyklack/middleclass",
			"anuvyklack/animation.nvim",
		},
		config = function()
			vim.o.winwidth = 10
			vim.o.winminwidth = 10
			vim.o.equalalways = false
			require("windows").setup()

			local function cmd(command)
				return table.concat({ "<Cmd>", command, "<CR>" })
			end

			vim.keymap.set("n", "<leader>\\", cmd("WindowsMaximize"))
			vim.keymap.set("n", "<leader>-", cmd("WindowsMaximizeVertically"))
			vim.keymap.set("n", "<leader>|", cmd("WindowsMaximizeHorizontally"))
			vim.keymap.set("n", "<leader>_", cmd("WindowsEqualize"))
		end,
	},
}
