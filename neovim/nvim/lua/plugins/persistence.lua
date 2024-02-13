return { -- Persists the state of nvim
  "folke/persistence.nvim",
  event = "BufReadPre",
  -- module = "persistence",
  config = function()
    require("persistence").setup({

      -- dir = vim.fn.stdpath("data") .. "/sessions/",
      dir = vim.fn.expand(vim.fn.stdpath("state") .. "/sessions/"), -- directory where session files are saved
      options = { "buffers", "curdir", "tabpages", "winsize" }, -- sessionoptions used for saving
      pre_save = nil, -- a function to call before saving the session
      save_empty = false, -- don't save if there are no open file buffers
    })

    -- keymappings
    vim.api.nvim_set_keymap(
      "n",
      "<leader>rs",
      "<cmd> lua require('persistence').load() <cr>",
      { desc = "[R]estore [S]ession in current directory", noremap = true, silent = true }
    )

    vim.api.nvim_set_keymap(
      "n",
      "<leader>rl",
      "<cmd> lua require('persistence').load({ last = true }) <cr>",
      { desc = "[R]estore [L]ast session", noremap = true, silent = true }
    )

    vim.api.nvim_set_keymap(
      "n",
      "<leader>qd",
      "<cmd>lua require('persistence').stop()<cr>",
      { desc = "[Q]uit restoring [D]ata on exit", noremap = true, silent = true }
    )
  end,
}
