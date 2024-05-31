return {
  -- Multiple cursor support
  { "mg979/vim-visual-multi" },
  -- Create annotations with one keybind, and jump your cursor in the inserted annotation
  {
    "danymat/neogen",
    dependencies = "nvim-treesitter/nvim-treesitter",
    cmd = "Neogen",
    keys = {
      {
        "<leader>ga",
        function()
          require("neogen").generate({})
        end,
        desc = "Generate Annotations",
      },
    },
    ---@param _ LazyPlugin
    ---@param opts table
    opts = function(_, opts)
      local snippet_engine = nil

      if vim.snippet ~= nil then
        snippet_engine = "nvim"
      else
        local util = require("lazyvim.util")
        if util.has("luasnip") then
          snippet_engine = "luasnip"
        elseif util.has("snippy") then
          snippet_engine = "snippy"
        elseif vim.g.loaded_vsnip then
          snippet_engine = "vsnip"
        end
      end

      opts.snippet_engine = snippet_engine
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
