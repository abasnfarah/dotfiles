return {
  -- Simple plugins can be specified as strings
  -- 'rstacruz/vim-closer',

  -- Base plugins used by a lot of other plugins
  "nvim-lua/popup.nvim",
  "nvim-lua/plenary.nvim",

  -- ColorSchemes
  "ellisonleao/gruvbox.nvim",
  "lunarvim/darkplus.nvim",
  "rebelot/kanagawa.nvim",
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

  -- tools
  "tpope/vim-surround", -- Awesome plugin for surround tags
  {
    "m4xshen/autoclose.nvim", -- Auto close and delete brackets, quotes, etc
    config = function()
      require("autoclose").setup({
        keys = {
          ["$"] = { escape = true, close = true, pair = "$$", disabled_filetypes = {} },
        },
      })
    end,
  },

  -- Go
  "fatih/vim-go",

  -- Tmux and vim integration
  -- 'alexghergh/nvim-tmux-navigation',

  -- cmp plugins
  --'hrsh7th/nvim-cmp',

  -- install without yarn or npm
  {
    "iamcco/markdown-preview.nvim",
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },

  -- Git --
  "airblade/vim-gitgutter",

  -- Copilot --
  "github/copilot.vim",

  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module='...'` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    },
    config = function()
      require("noice").setup({
        presets = { inc_rename = true },
      })
    end,
  },

  -- refactoring based on book by Martin Fowler
  -- "ThePrimeagen/refactoring.nvim",

  -- incremental rename
  {
    "smjonas/inc-rename.nvim",
    config = function()
      require("inc_rename").setup()
    end,
  },
}
