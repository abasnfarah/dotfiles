return {
  "nvimtools/none-ls.nvim",
  event = "VeryLazy",
  opts = function()
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
    local null_ls = require("null-ls")

    local opts = {
      sources = {
        null_ls.builtins.diagnostics.cpplint,
        null_ls.builtins.diagnostics.eslint_d,
        null_ls.builtins.diagnostics.pylint,
        null_ls.builtins.diagnostics.selene,
        null_ls.builtins.diagnostics.yamllint,
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.beautysh,
        null_ls.builtins.formatting.clang_format,
        null_ls.builtins.formatting.templ.with({
          filetypes = { "templ" },
        }),
        -- make prettier also format .prisma files
        null_ls.builtins.formatting.prettier.with({
          filetypes = {
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
            "json",
            "yaml",
            "markdown",
            "prisma",
          },
        }),
        null_ls.builtins.formatting.rustfmt,
        null_ls.builtins.formatting.stylua,
        -- null_ls.builtins.formatting.ocamlformat,
        -- null_ls.builtins.formatting.sql_formatter.with({ command = { "sleek" } }),
      },

      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({
            group = augroup,
            buffer = bufnr,
          })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ bufnr = bufnr })
            end,
          })
        end
      end,
    }

    return opts
  end,
}
