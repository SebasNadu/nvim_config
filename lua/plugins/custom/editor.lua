return {
  -- tmux & split window navigation
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },
  -- Git integration with UI
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
    config = true,
  },
  --
  {
    "NeogitOrg/neogit",
    cmd = "Neogit",
    opts = {
      integrations = { diffview = true },
      disable_commit_confirmation = true,
    },
    keys = {
      { "<leader>NG", "<cmd>Neogit kind=tab<cr>", desc = "Status" },
    },
  },
  -- Github integration
  {
    "pwntester/octo.nvim",
    cmd = "Octo",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("octo").setup({ enable_builtin = true })
      vim.cmd([[hi OctoEditable guibg=none]])
      vim.treesitter.language.register("markdown", "octo")
    end,
    keys = {
      { "<leader>go", "<cmd>Octo<cr>", desc = "Octo" },
      { "<leader>gl", "<cmd>Octo pr list<cr>", desc = "Octo pr list" },
    },
  },
  -- Help you to establish good command workflow and habits for nvim
  {
    "m4xshen/hardtime.nvim",
    dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
    opts = {
      max_count = 3,
      disable_mouse = false,
      disabled_keys = {
        ["<Up>"] = {},
        ["<Down>"] = {},
        ["<Left>"] = {},
        ["<Right>"] = {},
      },
    },
  },
  -- Speed up loading Lua modules in neovim to improve startup time
  {
    "lewis6991/impatient.nvim",
    config = function()
      local impatient = require("impatient")

      impatient.enable_profile()
    end,
  },
  -- Simple Note Taking
  {
    "gsuuon/note.nvim",
    config = function()
      -- local latte = require("catppuccin.palettes").get_palette("latte")
      local mocha = require("catppuccin.palettes").get_palette("mocha")
      -- titles
      vim.cmd("highlight TSDanger guifg=#E47E33")
      vim.cmd("highlight TSWarning guifg=#E7BA42")
      vim.cmd("highlight TSNote guifg=#3A80F7")
      vim.cmd("highlight noteSectionTitleTextMore guifg=#9B33A5")
      -- titles selector
      vim.cmd("highlight noteSectionTitleLine guifg=#ffffff")
      -- selectors
      vim.cmd("highlight noteSymbolWarn guifg=#e0af68")
      vim.cmd("highlight noteSymbolQuestion guifg=#0db9d7")
      vim.cmd("highlight noteSymbolSelect guifg=#10B981")
      vim.cmd("highlight noteSymbolFlow guifg=#ac8fe4")
      vim.cmd("highlight noteItemMarkerPaused guifg=#ac8fe4")

      vim.cmd("highlight noteItemDone guifg=#10B981")
      vim.cmd("highlight noteItemCancelled guifg=#db4b4b")

      require("note").setup({
        -- The directory where your notes will be stored
        spaces = { "~/Documents" },
        keymap = {
          prefix = "n",
        },
      })
    end,
  },
  -- Pomodoro timer for neovim
  {
    "epwalsh/pomo.nvim",
    version = "*", -- Recommended, use latest release instead of latest commit
    lazy = true,
    cmd = { "TimerStart", "TimerRepeat" },
    dependencies = {
      -- Optional, but highly recommended if you want to use the "Default" timer
      "rcarriga/nvim-notify",
    },
    opts = {
      -- How often the notifiers are updated.
      update_interval = 1000,
      notifiers = {
        {
          name = "Default",
          opts = {
            sticky = false,
            title_icon = "󱎫",
            text_icon = "󰄉",
          },
        },
        { name = "System" },
      },

      timers = {
        Break = {
          { name = "System" },
        },
      },
    },
    config = function(_, opts)
      require("pomo").setup(opts)
    end,
  },
  -- Vim-pencil helps you to write notes into vim
  {
    "preservim/vim-pencil",
  },
  -- Automatically adjusts Shiftwidth and expandtab heuristically
  {
    "tpope/vim-sleuth",
    enabled = false,
  },
  -- Auto session management
  {
    "rmagatti/auto-session",
    config = function()
      local auto_session = require("auto-session")

      auto_session.setup({
        log_level = vim.log.levels.ERROR,

        auto_session_suppress_dirs = { "~/", "~/Dev/", "~/Downloads", "~/Documents", "~/Desktop/" },
        auto_session_enable_last_session = false,
        auto_save_enabled = false,
        auto_restore_enabled = false,
        auto_session_use_git_branch = false,

        session_lens = {
          buftypes_to_ignore = {},
          load_on_setup = true,
          theme_conf = {
            winblend = 0,
            border = true,
          },
          previewer = true,
        },
      })

      local keymap = vim.keymap

      keymap.set("n", "<leader>Sr", "<cmd>SessionRestore<CR>", { desc = "Restore session for cwd" }) -- restore last workspace session for current directory
      keymap.set("n", "<leader>Ss", "<cmd>SessionSave<CR>", { desc = "Save session for auto session root dir" }) -- save workspace session for current working directory
      keymap.set("n", "<leader>Sd", "<cmd>SessionDelete<CR>", { desc = "Save session for auto session root dir" }) -- save workspace session for current working directory
      keymap.set(
        "n",
        "<leader>fs",
        require("auto-session.session-lens").search_session,
        { desc = "Search sessions", noremap = true }
      )
    end,
  },
  {
    "michaelrommel/nvim-silicon",
    lazy = true,
    cmd = "Silicon",
    init = function() end,
    config = function()
      require("silicon").setup({
        font = "FiraMono Nerd Font=34;Noto Nastaliq Urdu=34",
        theme = "Monokai Extended",
        background = "#94e2d5",
        window_title = function()
          return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()), ":t")
        end,
      })
    end,
  },
}
