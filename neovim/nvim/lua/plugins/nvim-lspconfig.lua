return {
  "neovim/nvim-lspconfig",
  dependencies = {
    -- Automatically install LSPs to stdpath for neovim
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",

    -- Automatically install formatters and linters to stdpath for neovim
    { "jay-babu/mason-null-ls.nvim", event = { "BufReadPre", "BufNewFile" } },

    -- Useful status updates for LSP
    -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
    { "j-hui/fidget.nvim", tag = "legacy", opts = {} },

    -- Additional lua configuration, makes nvim stuff amazing!
    "folke/neodev.nvim",

    -- Code action menu
    { "weilbith/nvim-code-action-menu", cmd = "CodeActionMenu" },

    -- Lsp inlay hints
    "lvimuser/lsp-inlayhints.nvim",

    -- Tailwind colors for LSP
    "abasnfarah/tailwindcss-colors.nvim",
  },
  config = function()
    -- configure lsp inlay hints
    local ih = require("lsp-inlayhints")
    ih.setup({
      only_current_line = true,

      eol = {
        right_align = true,
      },
    })

    local on_attach = function(c, bufnr)
      -- NOTE: Remember that lua is a real programming language, and as such it is possible
      -- to define small helper and utility functions so you don't have to repeat yourself
      -- many times.
      --
      -- In this case, we create a function that lets us more easily define mappings specific
      -- for LSP related items. It sets the mode, buffer and description for us each time.
      local nmap = function(keys, func, desc)
        if desc then
          desc = "LSP: " .. desc
        end

        vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
      end

      -- nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
      nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
      nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
      --nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
      nmap("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
      nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
      --nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
      --nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols'n

      -- See `:help K` for why this keymap
      nmap("K", vim.lsp.buf.hover, "Hover Documentation")
      nmap("<C-m>", vim.lsp.buf.signature_help, "Signature Documentation")

      -- Lesser used LSP functionality
      nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
      nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
      nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
      nmap("<leader>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, "[W]orkspace [L]ist Folders")

      -- Create a command `:Format` local to the LSP buffer
      vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
        vim.lsp.buf.format()
      end, { desc = "Format current buffer with LSP" })

      -- inlay hints
      ih.on_attach(c, bufnr)

      require("tailwindcss-colors").on_attach(c, bufnr)
    end

    local servers = {
      --Bash
      bashls = {},

      -- C/C++
      clangd = {},

      -- Prisma
      prismals = {},

      -- JSON/YAML/TOML/MARKDOWN
      yamlls = {},
      taplo = {},
      marksman = {},

      -- python
      pylsp = {},

      -- HTML/HTMX
      html = {},
      htmx = {},

      -- Go
      gopls = {
        go = {
          inlayHints = {
            parameterHints = true,
            typeHints = true,
            chainingHints = false,
            -- maxLength = 80,
          },
          completeUnimported = true,
          usePlaceholders = true,
          analyses = {
            unusedparams = true,
            unusedwrite = true,
            unusedany = true,
          },
        },
      },
      templ = {
        templ = {
          inlayHints = {
            chainingHints = true,
            parameterHints = true,
            typeHints = true,
          },
          cmd = { "templ", "lsp" },
          filetypes = { "templ" },
        },
      },

      -- Javascript/Typescript
      tsserver = {
        javascript = {
          inlayHints = {
            includeInlayEnumMemberValueHints = true,
            includeInlayFunctionLikeReturnTypeHints = true,
            includeInlayFunctionParameterTypeHints = true,
            includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
            includeInlayParameterNameHintsWhenArgumentMatchesName = true,
            includeInlayPropertyDeclarationTypeHints = true,
            includeInlayVariableTypeHints = true,
          },
        },

        typescript = {
          inlayHints = {
            includeInlayEnumMemberValueHints = true,
            includeInlayFunctionParameterTypeHints = true,
            includeInlayFunctionLikeReturnTypeHints = true,
            includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
            includeInlayParameterNameHintsWhenArgumentMatchesName = true,
            includeInlayPropertyDeclarationTypeHints = true,
            includeInlayVariableTypeHints = false,
          },
        },

        typescriptreact = {
          inlayHints = {
            includeInlayEnumMemberValueHints = true,
            includeInlayFunctionParameterTypeHints = true,
            includeInlayFunctionLikeReturnTypeHints = true,
            includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
            includeInlayParameterNameHintsWhenArgumentMatchesName = true,
            includeInlayPropertyDeclarationTypeHints = true,
            includeInlayVariableTypeHints = false,
          },
        },
      },
      tailwindcss = {
        filetypes = { "html", "css", "scss", "javascript", "javascriptreact", "typescript", "typescriptreact", "templ" },
        init_options = { userLanguages = { templ = "html" } },
      },

      -- Lua
      lua_ls = {
        Lua = {
          workspace = { checkThirdParty = false },
          telemetry = { enable = false },
          hint = {
            enable = false,
          },
          diagnostics = {
            disable = { "missing-fields", "incomplete-signature-doc" },
          },
        },
      },

      -- rust
      rust_analyzer = {
        rust = {
          inlayHints = {
            chainingHints = true,
            parameterHints = true,
            typeHints = true,
          },
        },
      },
    }

    require("neodev").setup()

    -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    -- for nvim-ufo fold
    capabilities.textDocument.foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true,
    }
    capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

    require("mason").setup()

    -- Ensure the servers above are installed
    local mason_lspconfig = require("mason-lspconfig")

    mason_lspconfig.setup({
      ensure_installed = vim.tbl_keys(servers),
    })

    mason_lspconfig.setup_handlers({
      function(server_name)
        require("lspconfig")[server_name].setup({
          capabilities = capabilities,
          on_attach = on_attach,
          settings = servers[server_name],
        })
      end,
    })

    local linters = {
      ensure_installed = {
        "cpplint",
        "eslint_d",
        "pylint",
        "selene",
        "yamllint",
        -- golangci_lint = {},
      },
    }

    local formatters = {
      ensure_installed = {
        "beautysh",
        "black",
        "clang_format",
        "prettier",
        "rustfmt",
        "stylua",
      },
    }

    local function merge_lists(a, b)
      for _, v in ipairs(b) do
        table.insert(a, v)
      end
      return a
    end

    require("mason-null-ls").setup({
      ensured_installed = merge_lists(linters.ensure_installed, formatters.ensure_installed),
      automatic_installation = true,
    })
  end,
}
