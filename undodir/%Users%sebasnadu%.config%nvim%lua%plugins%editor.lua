Vim�UnDo� ��m-��{}��D=�7SOA3��`�%��� �   �   		                             fY�X    _�                           ����                                                                                                                                                                                                                                                                                                                                       %           V        fY�L     �         �      		�         �    5��                          8                      �                         :                      5�_�                            ����                                                                                                                                                                                                                                                                                                                                       &           V        fY�W    �         �      	{   		"folke/flash.nvim",   		event = "VeryLazy",   		vscode = true,   		---@type Flash.Config   		opts = {},�      G   �   7   	},   	-- hipatterns   	{    		"echasnovski/mini.hipatterns",   		event = "BufReadPre",   
		opts = {   			highlighters = {   				hsl_color = {   .					pattern = "hsl%(%d+,? %d+%%?,? %d+%%?%)",   					group = function(_, match)   2						local utils = require("solarized-osaka.hsl")   &						--- @type string, string, string   J						local nh, ns, nl = match:match("hsl%((%d+),? (%d+)%%?,? (%d+)%%?%)")   )						--- @type number?, number?, number?   >						local h, s, l = tonumber(nh), tonumber(ns), tonumber(nl)   						--- @type string   /						local hex_color = utils.hslToHex(h, s, l)   D						return MiniHipatterns.compute_hex_color_group(hex_color, "bg")   						end,   				},   			},   		},   	},   	{   		"telescope.nvim",   		dependencies = {   			{   /				"nvim-telescope/telescope-fzf-native.nvim",   				build = "make",   			},   0			"nvim-telescope/telescope-file-browser.nvim",   		},   		optional = true,   
		keys = {   			{   				"<leader>fP",   				function()   .					require("telescope.builtin").find_files({   5						cwd = require("lazy.core.config").options.root,   					})   				end,   				desc = "Find Plugin File",   			},   			{   				"<leader>;",   				function()   1					local builtin = require("telescope.builtin")   					builtin.resume()   				end,   2				desc = "Resume the previous telescope picker",   			},   			{   					"sf",   				function()   +					local telescope = require("telescope")�   G   K   �      *					local function telescope_buffer_dir()   #						return vim.fn.expand("%:p:h")   					end�   K   ^   �      5					telescope.extensions.file_browser.file_browser({   						path = "%:p:h",   #						cwd = telescope_buffer_dir(),    						respect_gitignore = false,   						hidden = true,   						grouped = true,   						previewer = false,   						initial_mode = "normal",   &						layout_config = { height = 40 },   					})   				end,   C				desc = "Open File Browser with the path of the current buffer",   			},   		},   		config = function(_, opts)   )			local telescope = require("telescope")   /			local actions = require("telescope.actions")   J			local fb_actions = require("telescope").extensions.file_browser.actions�   ^   �   �   U   @			opts.defaults = vim.tbl_deep_extend("force", opts.defaults, {   				wrap_results = true,   #				layout_strategy = "horizontal",   0				layout_config = { prompt_position = "top" },   #				sorting_strategy = "ascending",   				winblend = 0,   				mappings = {   					n = {},   				},   			})   			opts.pickers = {   				diagnostics = {   					theme = "ivy",   					initial_mode = "normal",   					layout_config = {   						preview_cutoff = 9999,   					},   				},   			}   			opts.extensions = {   				file_browser = {   					theme = "dropdown",   B					-- disables netrw and use telescope-file-browser in its place   					hijack_netrw = true,   					mappings = {   )						-- your custom insert mode mappings   						["n"] = {   *							-- your custom normal mode mappings   !							["N"] = fb_actions.create,   *							["h"] = fb_actions.goto_parent_dir,   							["/"] = function()   								vim.cmd("startinsert")   							end,   )							["<C-u>"] = function(prompt_bufnr)   								for i = 1, 10 do   6									actions.move_selection_previous(prompt_bufnr)   								end   							end,   )							["<C-d>"] = function(prompt_bufnr)   								for i = 1, 10 do   2									actions.move_selection_next(prompt_bufnr)   								end   							end,   3							["<PageUp>"] = actions.preview_scrolling_up,   7							["<PageDown>"] = actions.preview_scrolling_down,   						},   					},   				},   			}   			telescope.setup(opts)   -			require("telescope").load_extension("fzf")   6			require("telescope").load_extension("file_browser")   		end,   	},   	{    		"nvim-neo-tree/neo-tree.nvim",   		optional = true,   		opts = function(_, opts)   N			opts.open_files_do_not_replace_types = opts.open_files_do_not_replace_types   <				or { "terminal", "Trouble", "qf", "Outline", "trouble" }   =			table.insert(opts.open_files_do_not_replace_types, "edgy")   		end,   	},   	{   		"folke/which-key.nvim",   		optional = true,   	},   	{   !		"iamcco/markdown-preview.nvim",   N		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },   		build = function()    			vim.fn["mkdp#util#install"]()   		end,   
		keys = {   			{   				"<leader>cp",   				ft = "markdown",   %				"<cmd>MarkdownPreviewToggle<cr>",   				desc = "Markdown Preview",   			},   		},   		config = function()   			vim.cmd([[do FileType]])   		end,   	},5��    ^       T      T      :
      \      �	      �    K                   �      �      G      �    G                
   �      T       d       �           6      6   
   �      �      �      �                       	       Z       e       5�_�                            ����                                                                                                                                                                                                                                                                                                                                       %           V        fY�     �      &   �   $   	-- {   	-- 	"folke/flash.nvim",   	-- 	event = "VeryLazy",   	-- 	---@type Flash.Config   	-- 	opts = {},   	-- 	-- stylua: ignore   	-- 	keys = {   `	-- 		{ "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },   q	-- 		{ "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },   [	-- 		{ "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },   t	-- 		{ "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },   j	-- 		{ "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },   	-- 	},   	-- },   	-- -- hipatterns   	-- {   #	-- 	"echasnovski/mini.hipatterns",   	-- 	event = "BufReadPre",   	-- 	opts = {   	-- 		highlighters = {   	-- 			hsl_color = {   1	-- 				pattern = "hsl%(%d+,? %d+%%?,? %d+%%?%)",   "	-- 				group = function(_, match)   5	-- 					local utils = require("solarized-osaka.hsl")   )	-- 					--- @type string, string, string   M	-- 					local nh, ns, nl = match:match("hsl%((%d+),? (%d+)%%?,? (%d+)%%?%)")   ,	-- 					--- @type number?, number?, number?   A	-- 					local h, s, l = tonumber(nh), tonumber(ns), tonumber(nl)   	-- 					--- @type string   2	-- 					local hex_color = utils.hslToHex(h, s, l)   G	-- 					return MiniHipatterns.compute_hex_color_group(hex_color, "bg")   	-- 				end,   		-- 			},   	-- 		},   	-- 	},   	-- },5��           $       $       	             m      5�_�                             ����                                                                                                                                                                                                                                                                                                                                                  V        fY�    �   ]   �   �   U   C      opts.defaults = vim.tbl_deep_extend("force", opts.defaults, {           wrap_results = true,   '        layout_strategy = "horizontal",   4        layout_config = { prompt_position = "top" },   '        sorting_strategy = "ascending",           winblend = 0,           mappings = {             n = {},   
        },         })         opts.pickers = {           diagnostics = {             theme = "ivy",   "          initial_mode = "normal",             layout_config = {   "            preview_cutoff = 9999,             },   
        },         }         opts.extensions = {           file_browser = {             theme = "dropdown",   G          -- disables netrw and use telescope-file-browser in its place             hijack_netrw = true,             mappings = {   /            -- your custom insert mode mappings               ["n"] = {   1              -- your custom normal mode mappings   (              ["N"] = fb_actions.create,   1              ["h"] = fb_actions.goto_parent_dir,                  ["/"] = function()   &                vim.cmd("startinsert")                 end,   0              ["<C-u>"] = function(prompt_bufnr)                    for i = 1, 10 do   ?                  actions.move_selection_previous(prompt_bufnr)                   end                 end,   0              ["<C-d>"] = function(prompt_bufnr)                    for i = 1, 10 do   ;                  actions.move_selection_next(prompt_bufnr)                   end                 end,   :              ["<PageUp>"] = actions.preview_scrolling_up,   >              ["<PageDown>"] = actions.preview_scrolling_down,               },             },   
        },         }         telescope.setup(opts)   0      require("telescope").load_extension("fzf")   9      require("telescope").load_extension("file_browser")       end,     },     {   "    "nvim-neo-tree/neo-tree.nvim",       optional = true,       opts = function(_, opts)   Q      opts.open_files_do_not_replace_types = opts.open_files_do_not_replace_types   @        or { "terminal", "Trouble", "qf", "Outline", "trouble" }   @      table.insert(opts.open_files_do_not_replace_types, "edgy")       end,     },     {       "folke/which-key.nvim",       optional = true,     },     {   #    "iamcco/markdown-preview.nvim",   P    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },       build = function()   #      vim.fn["mkdp#util#install"]()       end,       keys = {         {           "<leader>cp",           ft = "markdown",   )        "<cmd>MarkdownPreviewToggle<cr>",   "        desc = "Markdown Preview",         },       },       config = function()         vim.cmd([[do FileType]])       end,     },�   J   ]   �      :          telescope.extensions.file_browser.file_browser({               path = "%:p:h",   )            cwd = telescope_buffer_dir(),   &            respect_gitignore = false,               hidden = true,               grouped = true,               previewer = false,   $            initial_mode = "normal",   ,            layout_config = { height = 40 },             })           end,   G        desc = "Open File Browser with the path of the current buffer",         },       },       config = function(_, opts)   ,      local telescope = require("telescope")   2      local actions = require("telescope.actions")   M      local fb_actions = require("telescope").extensions.file_browser.actions�   F   J   �      /          local function telescope_buffer_dir()   )            return vim.fn.expand("%:p:h")             end�      F   �   D     -- {     -- 	"folke/flash.nvim",     -- 	event = "VeryLazy",     -- 	---@type Flash.Config     -- 	opts = {},     -- 	-- stylua: ignore     -- 	keys = {   a  -- 		{ "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },   r  -- 		{ "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },   \  -- 		{ "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },   u  -- 		{ "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },   k  -- 		{ "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },     -- 	},     -- },     -- -- hipatterns     -- {   $  -- 	"echasnovski/mini.hipatterns",     -- 	event = "BufReadPre",     -- 	opts = {     -- 		highlighters = {     -- 			hsl_color = {   2  -- 				pattern = "hsl%(%d+,? %d+%%?,? %d+%%?%)",   #  -- 				group = function(_, match)   6  -- 					local utils = require("solarized-osaka.hsl")   *  -- 					--- @type string, string, string   N  -- 					local nh, ns, nl = match:match("hsl%((%d+),? (%d+)%%?,? (%d+)%%?%)")   -  -- 					--- @type number?, number?, number?   B  -- 					local h, s, l = tonumber(nh), tonumber(ns), tonumber(nl)     -- 					--- @type string   3  -- 					local hex_color = utils.hslToHex(h, s, l)   H  -- 					return MiniHipatterns.compute_hex_color_group(hex_color, "bg")     -- 				end,   
  -- 			},   	  -- 		},     -- 	},     -- },     {       "telescope.nvim",       dependencies = {         {   3        "nvim-telescope/telescope-fzf-native.nvim",           build = "make",         },   3      "nvim-telescope/telescope-file-browser.nvim",       },       optional = true,       keys = {         {           "<leader>fP",           function()   3          require("telescope.builtin").find_files({   ;            cwd = require("lazy.core.config").options.root,             })           end,   "        desc = "Find Plugin File",         },         {           "<leader>;",           function()   6          local builtin = require("telescope.builtin")             builtin.resume()           end,   6        desc = "Resume the previous telescope picker",         },         {           "sf",           function()   0          local telescope = require("telescope")5��    ]       T      T      �
      \      �	      �    J                   W      �      G      �    F                
   �      T       d       �           C      C   
   	       �      c      5��