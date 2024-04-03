return {
	{
		"folke/noice.nvim",
		opts = function(_, opts)
			table.insert(opts.routes, {
				filter = {
					event = "notify",
					find = "No information available",
				},
				opts = { skip = true },
			})
			local focused = true
			vim.api.nvim_create_autocmd("FocusGained", {
				callback = function()
					focused = true
				end,
			})
			vim.api.nvim_create_autocmd("FocusLost", {
				callback = function()
					focused = false
				end,
			})
			table.insert(opts.routes, 1, {
				filter = {
					cond = function()
						return not focused
					end,
				},
				view = "notify_send",
				opts = { stop = false },
			})

			opts.commands = {
				all = {
					-- options for the message history that you get with `:Noice`
					view = "split",
					opts = { enter = true, format = "details" },
					filter = {},
				},
			}

			vim.api.nvim_create_autocmd("FileType", {
				pattern = "markdown",
				callback = function(event)
					vim.schedule(function()
						require("noice.text.markdown").keys(event.buf)
					end)
				end,
			})

			opts.presets.lsp_doc_border = true
		end,
	},

	{
		"rcarriga/nvim-notify",
		opts = {
			timeout = 5000,
			background_colour = "#000000",
		},
		config = function(_, opts)
			require("notify").setup(opts)
		end,
	},

	-- animations
	{
		"echasnovski/mini.animate",
		event = "VeryLazy",
		-- opts = function(_, opts)
		-- 	opts.scroll = {
		-- 		enable = false,
		-- 	}
		-- end,
	},

	-- buffer line
	{
		"akinsho/bufferline.nvim",
		event = "VeryLazy",
		optional = true,
		opts = {
			options = {
				mode = "tabs",
				-- separator_style = "slant",
				show_buffer_close_icons = false,
				show_close_icon = false,
			},
		},
	},

	-- statusline
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		optional = true,
		opts = function(_, opts)
			local mocha = require("catppuccin.palettes").get_palette("mocha")
			local insert = {
				function()
					local pomo = require("pomo")
					local timer = pomo.get_first_to_finish()
					if timer == nil then
						return ""
					end
					return tostring(timer)
				end,
				color = { fg = mocha.subtext1, gui = "bold" },
				icon = "󰥔",
				"encoding",
				"fileformat",
				"filetype",
			}
			local sessions = {
				function()
					local auto = require("auto-session.lib")
					local session = auto.current_session_name()
					if session == nil then
						return ""
					end
					return session
				end,
				color = { fg = mocha.subtext1, gui = "bold" },
				icon = "",
				"encoding",
				"fileformat",
				"filetype",
			}
			table.insert(opts.sections.lualine_x, insert)
			table.insert(opts.sections.lualine_x, sessions)
			opts.options.theme = "catppuccin"
		end,
	},
	-- Dashboard for nvim
	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		optional = true,
		opts = function(_, opts)
			local logo = [[
███████╗███████╗██████╗  █████╗ ███████╗███╗   ██╗ █████╗ ██████╗ ██╗   ██╗
██╔════╝██╔════╝██╔══██╗██╔══██╗██╔════╝████╗  ██║██╔══██╗██╔══██╗██║   ██║
███████╗█████╗  ██████╔╝███████║███████╗██╔██╗ ██║███████║██║  ██║██║   ██║
╚════██║██╔══╝  ██╔══██╗██╔══██║╚════██║██║╚██╗██║██╔══██║██║  ██║██║   ██║
███████║███████╗██████╔╝██║  ██║███████║██║ ╚████║██║  ██║██████╔╝╚██████╔╝
╚══════╝╚══════╝╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═══╝╚═╝  ╚═╝╚═════╝  ╚═════╝ 
      ]]

			local function getGreeting(name)
				local tableTime = os.date("*t")
				local datetime = os.date(" %Y-%m-%d   %H:%M:%S")
				local hour = tableTime.hour
				local greetingsTable = {
					[1] = "  Sleep well",
					[2] = "  Good morning",
					[3] = "  Good afternoon",
					[4] = "  Good evening",
					[5] = "󰖔  Good night",
				}
				local greetingIndex = 0
				if hour == 23 or hour < 7 then
					greetingIndex = 1
				elseif hour < 12 then
					greetingIndex = 2
				elseif hour >= 12 and hour < 18 then
					greetingIndex = 3
				elseif hour >= 18 and hour < 21 then
					greetingIndex = 4
				elseif hour >= 21 then
					greetingIndex = 5
				end
				return "\t\t\t" .. datetime .. "\t" .. greetingsTable[greetingIndex] .. ", " .. name
			end

			local userName = "Sebas"
			local greeting = getGreeting(userName)
			logo = string.rep("\n", 8) .. logo .. "\n"
			opts.config.header = vim.split(logo .. greeting .. "\n\n", "\n")
		end,
	},
	-- Window layout
	{
		"folke/edgy.nvim",
		optional = true,
		-- opts = function(_, opts)
		--   local edgy_idx = Util.plugin.extra_idx("ui.edgy")
		--   local aerial_idx = Util.plugin.extra_idx("editor.aerial")
		--
		--   if edgy_idx and edgy_idx > aerial_idx then
		--     Util.warn("The `edgy.nvim` extra must be **imported** before the `aerial.nvim` extra to work properly.", {
		--       title = "LazyVim",
		--     })
		--   end
		--
		--   opts.right = opts.right or {}
		--   table.insert(opts.right, {
		--     title = "Aerial",
		--     ft = "aerial",
		--     pinned = true,
		--     open = "AerialOpen",
		--   })
		-- end,
	},
}
