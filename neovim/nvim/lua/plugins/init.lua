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
  --
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
  -- "github/copilot.vim",

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

  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    console = function()
      require("cyberdream").setup({
        -- Set light or dark variant
        variant = "auto", -- use "light" for the light variant. Also accepts "auto" to set dark or light colors based on the current value of `vim.o.background`

        -- Enable transparent background
        transparent = true,

        -- Reduce the overall saturation of colours for a more muted look
        saturation = 1, -- accepts a value between 0 and 1. 0 will be fully desaturated (greyscale) and 1 will be the full color (default)

        -- Enable italics comments
        italic_comments = true,

        -- Replace all fillchars with ' ' for the ultimate clean look
        hide_fillchars = true,

        -- Apply a modern borderless look to pickers like Telescope, Snacks Picker & Fzf-Lua
        borderless_pickers = true,

        -- Set terminal colors used in `:terminal`
        terminal_colors = true,

        -- Improve start up time by caching highlights. Generate cache with :CyberdreamBuildCache and clear with :CyberdreamClearCache
        cache = true,

        -- Override highlight groups with your own colour values
        highlights = {
          -- Highlight groups to override, adding new groups is also possible
          -- See `:h highlight-groups` for a list of highlight groups or run `:hi` to see all groups and their current values

          -- Example:
          Comment = { fg = "#696969", bg = "NONE", italic = true },

          -- More examples can be found in `lua/cyberdream/extensions/*.lua`
        },

        -- Override a highlight group entirely using the built-in colour palette
        overrides = function(colors) -- NOTE: This function nullifies the `highlights` option
          -- Example:
          return {
            Comment = { fg = colors.green, bg = "NONE", italic = true },
            ["@property"] = { fg = colors.magenta, bold = true },
          }
        end,

        -- Override colors
        colors = {
          -- For a list of colors see `lua/cyberdream/colours.lua`

          -- Override colors for both light and dark variants
          bg = "#000000",
          green = "#00ff00",

          -- If you want to override colors for light or dark variants only, use the following format:
          dark = {
            magenta = "#ff00ff",
            fg = "#eeeeee",
          },
          light = {
            red = "#ff5c57",
            cyan = "#5ef1ff",
          },
        },

        -- Disable or enable colorscheme extensions
        extensions = {
          telescope = true,
          notify = true,
          mini = true,
          true,
          -- ...,
        },
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

  -- annotation toolkit
  {
    "danymat/neogen",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("neogen").setup({})
      local opts = {
        silent = true,
        noremap = true,
      }
      vim.api.nvim_set_keymap("n", "<leader>nf", ":lua require('neogen').generate()<CR>", opts)
    end,
  },
}
