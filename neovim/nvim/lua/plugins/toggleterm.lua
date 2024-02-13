return { -- terminal for nvim
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    local tt = require("toggleterm")
    local remap = vim.keymap.set

    tt.setup({
      size = 20,
      -- open_mapping = [[<c-\>]],
      on_open = function(term)
        vim.cmd("echo 'New terminal has been opened!'")
      end,
      on_close = function(term)
        vim.cmd("echo 'Terminal closed'")
      end,
      hide_numbers = true, -- hide the number column in toggleterm buffers
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = "1", -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
      start_in_insert = true,
      insert_mappings = true, -- whether or not the open mapping applies in insert mode
      persist_size = true,
      -- direction = "horizontal",
      direction = "float",
      close_on_exit = true, -- close the terminal window when the process exits
      shell = vim.o.shell, -- change the default shell
      float_opts = {
        border = "single",
        width = 100,
        height = 30,
        winblend = 3,
        highlights = {
          border = "Normal",
          background = "Normal",
        },
      },
    })

    remap("n", "<leader>t", "<cmd>ToggleTerm<cr>", { desc = "[T]oggleterm: Open terminal" })
    remap("n", "<leader>T", "<cmd>ToggleTerm direction=horizontal<cr>", { desc = "[T]oggleterm: Open terminal" })
    function _G.set_terminal_keymaps()
      local opts = { buffer = 0 }
      vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
      vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
      vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
      vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
      vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
      vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
      vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
    end

    -- if you only want these mappings for toggle term use term://*toggleterm#* instead
    vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
  end,
}
