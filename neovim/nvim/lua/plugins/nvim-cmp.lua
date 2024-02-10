return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-nvim-lsp-signature-help',
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    'rafamadriz/friendly-snippets',
    'onsails/lspkind.nvim',
  },
  config = function ()
  local cmp = require'cmp'
  local luasnip = require'luasnip'
  local lspkind = require('lspkind')
  require("luasnip/loaders/from_vscode").lazy_load()
  luasnip.config.setup {}

  local icons = {
    Namespace = "󰌗",
    Text = "󰉿",
    Method = "󰆧",
    Function = "󰆧",
    Constructor = "",
    Field = "󰜢",
    Variable = "󰀫",
    Class = "󰠱",
    Interface = "",
    Module = "",
    Property = "󰜢",
    Unit = "󰑭",
    Value = "󰎠",
    Enum = "",
    Keyword = "󰌋",
    Snippet = "",
    Color = "󰏘",
    File = "󰈚",
    Reference = "󰈇",
    Folder = "󰉋",
    EnumMember = "",
    Constant = "󰏿",
    Struct = "󰙅",
    Event = "",
    Operator = "󰆕",
    TypeParameter = "󰊄",
    Table = "",
    Object = "󰅩",
    Tag = "",
    Array = "[]",
    Boolean = "",
    Number = "",
    Null = "󰟢",
    String = "󰉿",
    Calendar = "",
    Watch = "󰥔",
    Package = "",
    Copilot = "",
    Codeium = "",
    TabNine = "",
  }

  local function border(hl_name)
    return {
      { "╭", hl_name },
      { "─", hl_name },
      { "╮", hl_name },
      { "│", hl_name },
      { "╯", hl_name },
      { "─", hl_name },
      { "╰", hl_name },
      { "│", hl_name },
    }
  end

  local field_arrangement = {
    atom = { "kind", "abbr", "menu" },
    atom_colored = { "kind", "abbr", "menu" },
  }

  local default_values = {
      icons = true,
      lspkind_text = true,
      style = "default", -- default/flat_light/flat_dark/atom/atom_colored
      border_color = "grey_fg", -- only applicable for "default" style, use color names from base30 variables
      selected_item_bg = "colored", -- colored / simple
  }

  local formatting_style = {
    -- default fields order i.e completion word + item.kind + item.kind icons
    fields = field_arrangement[default_values.style] or { "abbr", "kind", "menu" },

    format = function(_, item)
      local icon = (default_values.icons and icons[item.kind]) or ""

      icon = default_values.lspkind_text and (" " .. icon .. " ") or icon
      item.kind = string.format("%s %s", icon, default_values.lspkind_text and item.kind or "")

      return item
    end,
  }

  cmp.setup({
    completion = {
      completeopt = "menu,menuone",
    },

    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        luasnip.lsp_expand(args.body) -- For `luasnip` users.
      end,
    },

    window = {
      completion = {
        side_padding = 1,
        -- winhighlight = "Normal:CmpPmenu,CursorLine:CmpSel,Search:None",
        winhighlight = "Normal:CmpPmenu,Search:None",
        scrollbar = true,
        border = border "CmpBorder",
      },
      documentation = {
        border = border "CmpDocBorder",
        winhighlight = "Normal:CmpDoc",
      },
    },

    mapping = cmp.mapping.preset.insert({
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<CR>'] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      }, -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      ['<Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expandable() then
          luasnip.expand_or_jumpable()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        else
          fallback()
        end
      end, { 'i', 's' }),
      ['<S-Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { 'i', 's' }),
    }),

    formatting = formatting_style,

    -- formatting = {
    --   fields = { 'abbr', 'menu' },
    --   -- format = function(entry, vim_item)
    --   format = lspkind.cmp_format({
    --     mode = 'symbol', -- show only symbol annotations
    --     maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
    --     ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
    --
    --     -- The function below will be called before any actual modifications from lspkind
    --     -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
    --     before = function (entry, vim_item)
    --       -- fancy icons and a name of kind
    --       vim_item.kind = require("lspkind").presets.default[vim_item.kind] .. " " .. vim_item.kind
    --       vim_item.menu = ({
    --         luasnip = '[Snippet]',
    --         buffer = '[Buffer]',
    --         path = '[Path]',
    --       })[entry.source.name]
    --       return vim_item
    --     end
    --   })
    -- },

    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'luasnip' }, -- For luasnip users.
      { name = 'buffer' },
      { name = "nvim_lua" },
      { name = 'path' },
      { name = 'nvim_lsp_signature_help' },
    }),
    confirm_opts = {
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,

    },
  })
  end
}
