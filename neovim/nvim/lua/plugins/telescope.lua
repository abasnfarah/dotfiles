return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-lua/popup.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    telescope.setup({
      defaults = {
        layout_config = {
          prompt_position = "bottom",
          horizontal = {
            -- Move previewer to the right
            mirror = false,
            preview_cutoff = 1,
            preview_width = 0.5,
          },
          vertical = {
            mirror = false,
            preview_cutoff = 0.4,
          },
          flex = {
            flip_columns = 120,
          },
        },

        prompt_prefix = " ",
        selection_caret = " ",
        path_display = { "smart" },

        mappings = {
          i = {
            ["<C-n>"] = actions.cycle_history_next,
            ["<C-p>"] = actions.cycle_history_prev,

            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,

            ["<C-c>"] = actions.close,

            ["<Down>"] = actions.move_selection_next,
            ["<Up>"] = actions.move_selection_previous,

            ["<CR>"] = actions.select_default,
            ["<C-x>"] = actions.select_horizontal,
            ["<C-v>"] = actions.select_vertical,
            ["<C-t>"] = actions.select_tab,

            ["<C-u>"] = actions.preview_scrolling_up,
            ["<C-d>"] = actions.preview_scrolling_down,

            ["<PageUp>"] = actions.results_scrolling_up,
            ["<PageDown>"] = actions.results_scrolling_down,

            ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
            ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
            ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
            ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            ["<C-l>"] = actions.complete_tag,
            ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
          },

          n = {
            ["<esc>"] = actions.close,
            ["<CR>"] = actions.select_default,
            ["<C-x>"] = actions.select_horizontal,
            ["<C-v>"] = actions.select_vertical,
            ["<C-t>"] = actions.select_tab,

            ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
            ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
            ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
            ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

            ["j"] = actions.move_selection_next,
            ["k"] = actions.move_selection_previous,
            ["H"] = actions.move_to_top,
            ["M"] = actions.move_to_middle,
            ["L"] = actions.move_to_bottom,

            ["<Down>"] = actions.move_selection_next,
            ["<Up>"] = actions.move_selection_previous,
            ["gg"] = actions.move_to_top,
            ["G"] = actions.move_to_bottom,

            ["<C-u>"] = actions.preview_scrolling_up,
            ["<C-d>"] = actions.preview_scrolling_down,

            ["<PageUp>"] = actions.results_scrolling_up,
            ["<PageDown>"] = actions.results_scrolling_down,

            ["?"] = actions.which_key,
          },
        },
      },
      -- pickers = {
      -- Default configuration for builtin pickers goes here:
      -- picker_name = {
      --   picker_config_key = value,
      --   ...
      -- }
      -- Now the picker_config_key will be applied every time you call this
      -- builtin picker
      -- },
      extensions = {
        -- Your extension configuration goes here:
        -- extension_name = {
        -- extension_config_key = value,
        ["ui-select"] = {
          require("telescope.themes").get_dropdown({}),
        },
      },
      -- please take a look at the readme of the extension you want to configure
      -- },
    })

    telescope.load_extension("noice")
    telescope.load_extension("ui-select")

    local remap = vim.keymap.set
    pcall(telescope.load_extension, "fzf")
    -- See `:help telescope.builtin`
    remap("n", "<leader>?", require("telescope.builtin").oldfiles, { desc = "[?] Find recently opened files" })
    remap("n", "<leader><space>", require("telescope.builtin").buffers, { desc = "[ ] Find existing buffers" })
    remap("n", "<leader>/", function()
      -- You can pass additional configuration to telescope to change theme, layout, etc.
      require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
        winblend = 10,
        previewer = true,
      }))
    end, { desc = "[/] Fuzzily search in current buffer" })

    remap("n", "<leader>gf", require("telescope.builtin").git_files, { desc = "Search [G]it [F]iles" })
    remap("n", "<leader>gb", require("telescope.builtin").git_branches, { desc = "Search [G]it [B]ranches" })
    remap("n", "<leader>gl", require("telescope.builtin").git_commits, { desc = "Search [G]it [C]ommits" })
    remap("n", "<leader>gs", require("telescope.builtin").git_status, { desc = "Search [G]it [S]tatus" })
    remap("n", "<leader>f", require("telescope.builtin").find_files, { desc = "Find [F]iles" })
    remap("n", "<leader>b", require("telescope.builtin").buffers, { desc = "Find [B]uffers" })
    remap("n", "<leader>sh", require("telescope.builtin").help_tags, { desc = "[S]earch [H]elp" })
    remap("n", "<leader>sw", require("telescope.builtin").grep_string, { desc = "[S]earch current [W]ord" })
    remap("n", "<leader>sg", require("telescope.builtin").live_grep, { desc = "[S]earch by [G]rep" })
    remap("n", "<leader>sd", require("telescope.builtin").diagnostics, { desc = "[S]earch [D]iagnostics" })
    remap("n", "<leader>qf", require("telescope.builtin").lsp_references, { desc = "telescope [Q]uick [F]ix" })
    remap("n", "<leader>km", require("telescope.builtin").keymaps, { desc = "[K]ey[M]aps" })
  end,
}
