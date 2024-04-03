return {
	-- Multiple cursor support
	{ "mg979/vim-visual-multi" },
	-- Create annotations with one keybind, and jump your cursor in the inserted annotation
	{
		"danymat/neogen",
		keys = {
			{
				"<leader>cc",
				function()
					require("neogen").generate({})
				end,
				desc = "Neogen Comment",
			},
		},
		opts = { snippet_engine = "luasnip" },
	},
	-- Incremental rename
	{
		"smjonas/inc-rename.nvim",
		config = function()
			require("inc_rename").setup()
			vim.keymap.set("n", "<leader>rn", function()
				return ":IncRename " .. vim.fn.expand("<cword>")
			end, { expr = true, desc = "Incrementally rename current word" })
		end,
	},
	-- Refactoring tool
	{
		"ThePrimeagen/refactoring.nvim",
		keys = {
			{
				"<leader>R",
				function()
					require("refactoring").select_refactor()
				end,
				mode = "v",
				noremap = true,
				silent = true,
				expr = false,
			},
			-- { "<leader>rs", function() require("telescope").extensions.refactoring.refactors() end, mode = { "v" }, desc = "Refactor", },
			-- { "<leader>ri", function() require("refactoring").refactor("Inline Variable") end, mode = {"n","v"}, desc =  "Inline Variable" },
			-- { "<leader>rb", function() require('refactoring').refactor('Exract Block') end, mode = {"n"}, desc = "Extract Block" },
			-- { "<leader>rf", function() require('refactoring').refactor('Exract Block To File') end, mode = {"n"}, desc = "Extract Block to File" },
			-- { "<leader>rP", function() require('refactoring').debug.printf({below = false}) end,  mode = {"n"}, desc = "Debug Print" },
			-- { "<leader>rp", function() require('refactoring').debug.print_var({normal = true}) end, mode = {"n"}, desc = "Debug Print Variable" },
			-- { "<leader>rc", function() require('refactoring').debug.cleanup({}) end, mode = {"n"}, desc = "Debug Cleanup" },
			-- { "<leader>rf", function() require('refactoring').refactor('Extract Function') end,  mode = {"v"}, desc = "Extract Function" },
			-- { "<leader>rF", function() require('refactoring').refactor('Extract Function to File') end, mode = {"v"}, desc =  "Extract Function to File" },
			-- { "<leader>rx", function() require('refactoring').refactor('Extract Variable') end, mode = {"v"}, desc = "Extract Variable" },
			-- { "<leader>rp", function() require('refactoring').debug.print_var({}) end, mode = {"v"}, desc =  "Debug Print Variable" },
		},
		opts = {},
		config = function()
			require("telescope").load_extension("refactoring")
		end,
	},
	-- Better increase/descrease
	{
		"monaqa/dial.nvim",
		keys = {
			{
				"+",
				function()
					return require("dial.map").inc_normal()
				end,
				expr = true,
				desc = "Increment",
			},
			{
				"-",
				function()
					return require("dial.map").dec_normal()
				end,
				expr = true,
				desc = "Decrement",
			},
		},
		config = function()
			local augend = require("dial.augend")
			require("dial.config").augends:register_group({
				default = {
					augend.integer.alias.decimal,
					augend.integer.alias.hex,
					augend.date.alias["%Y/%m/%d"],
					augend.constant.alias.bool,
					augend.semver.alias.semver,
					augend.constant.new({ elements = { "let", "const" } }),
				},
			})
		end,
	},
	-- Diagnostic debugging with ChatGPT or Google
	{
		"piersolenski/wtf.nvim",
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
		opts = {},
		keys = {
			{
				"<leader>sD",
				function()
					require("wtf").ai()
				end,
				desc = "Search Diagnostic with AI",
			},
			{
				"<leader>sd",
				function()
					require("wtf").search()
				end,
				desc = "Search Diagnostic with Google",
			},
		},
	},
	-- LLM (Language Model) for code generation
	{
		"gsuuon/model.nvim",
		config = function()
			require("model").setup({
				prompts = vim.tbl_extend("force", require("model.prompts.starters"), require("utils.prompt_lib")),
			})

			local keymap = vim.keymap
			keymap.set({ "n", "v" }, "<leader>ml", "<cmd> Llm<CR>", { desc = "LLM Generate" })
			keymap.set({ "n", "v" }, "<leader>md", "<cmd> LlmDelete<CR>", { desc = "LLM Delete" })
			keymap.set({ "n", "v" }, "<leader>mv", "<cmd> LlmSelect<CR>", { desc = "LLM Rename" })
			keymap.set({ "n", "v" }, "<leader>ms", "<cmd> LlmShow<CR>", { desc = "LLM List" })
			keymap.set({ "n", "v" }, "<leader>mc", "<cmd> LlmCancel<CR>", { desc = "LLM Clear" })
			keymap.set({ "n", "v" }, "<leader>mx", [[:LlmMulti <C-e>]], { desc = "LLM Prompt" })
			keymap.set({ "n", "v" }, "<leader>mp", [[:Llm <C-e>]], { desc = "LLM Prompt" })
		end,
	},
	-- Highlight all instances of a word in the buffer
	{
		"kevinhwang91/nvim-hlslens",
		enabled = false,
		config = function()
			require("hlslens").setup()
			local kopts = { noremap = true, silent = true }

			vim.api.nvim_set_keymap(
				"n",
				"n",
				[[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
				kopts
			)
			vim.api.nvim_set_keymap(
				"n",
				"N",
				[[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
				kopts
			)
			vim.api.nvim_set_keymap("n", "*", [[*<Cmd>lua require('hlslens').start()<CR>]], kopts)
			vim.api.nvim_set_keymap("n", "#", [[#<Cmd>lua require('hlslens').start()<CR>]], kopts)
			vim.api.nvim_set_keymap("n", "g*", [[g*<Cmd>lua require('hlslens').start()<CR>]], kopts)
			vim.api.nvim_set_keymap("n", "g#", [[g#<Cmd>lua require('hlslens').start()<CR>]], kopts)

			vim.api.nvim_set_keymap("n", "<Leader>X", "<Cmd>noh<CR>", kopts)
		end,
	},
	-- Treesitter Split/Join functionalyty for javascript
	{
		"Wansmer/treesj",
		-- enabled = false,
		cmd = { "TSJToggle", "TSJSplit", "TSJJoin" },
		keys = {
			{ "<leader>J", "<cmd>TSJToggle<cr>", desc = "Toggle Split/Join" },
		},
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("treesj").setup({
				use_default_keymaps = false,
			})
		end,
	},
	-- LeetCode integration into NVIM
	{
		"Dhanus3133/LeetBuddy.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
		config = function()
			local sep = require("plenary.path").path.sep
			require("leetbuddy").setup({
				domain = "com",
				language = "js",
				directory = vim.loop.os_homedir() .. sep .. ".leetcode",
				debug = false,
			})
		end,
		-- keys = {
		-- 	{ "<leader>lq", "<cmd>LBQuestions<cr>", desc = "List Questions" },
		-- 	{ "<leader>ll", "<cmd>LBQuestion<cr>", desc = "View Question" },
		-- 	{ "<leader>lr", "<cmd>LBReset<cr>", desc = "Reset Code" },
		-- 	{ "<leader>lt", "<cmd>LBTest<cr>", desc = "Run Code" },
		-- 	{ "<leader>ls", "<cmd>LBSubmit<cr>", desc = "Submit Code" },
		-- },
	},

	{
		"numToStr/Comment.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
		lazy = false,
		config = function()
			-- import comment plugin safely
			local comment = require("Comment")

			local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")

			-- enable comment
			comment.setup({
				-- for commenting tsx and jsx files
				ignore = "^$",
				pre_hook = ts_context_commentstring.create_pre_hook(),
			})
		end,
	},
}
