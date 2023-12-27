return {
  'nvim-neo-tree/neo-tree.nvim',
  cmd = 'Neotree',
  branch = 'v2.x',
  keys = {
    { '<leader>e', '<cmd>Neotree toggle<cr>', desc = 'Neotree'},
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  config = function ()
    -- Unless you are still migrating, remove the deprecated commands from v1.x
    vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
 -- Start NvimTree when Vim starts with a directory argument.
    
    require('neo-tree').setup({
      enable_git_status = true,
      enable_diagnostics = true,
      sort_function = nil , -- use a custom function for sorting files and directories in the tree 
      -- sort_function = function (a,b)
      --       if a.type == b.type then
      --           return a.path > b.path
      --       else
      --           return a.type > b.type
      --       end
      --   end , -- this sorts files and directories descendantly
      
      default_component_configs = {
        modified = {
          symbol = '[+]',
          highlight = 'NeoTreeModified',
        },
        name = {
          trailing_slash = false,
          use_git_status_colors = true,
          highlight = 'NeoTreeFileName',
        },

        git_status = {
          symbols = {
            -- Change type
            added     = '', -- or '✚', but this is redundant info if you use git_status_colors on the name
            modified  = '', -- or '', but this is redundant info if you use git_status_colors on the name
            deleted   = '✖',-- this can only be used in the git_status source
            renamed   = '',-- this can only be used in the git_status source
            -- Status type
            untracked = '',
            ignored   = '',
            unstaged  = '',
            staged    = '',
            conflict  = '',
          }
        },
      },

      window = {
        position = 'left',
        width = 40,
        mapping_options = {
          noremap = true,
          nowait = true,
        },
        mappings = {
          ['<2-LeftMouse>'] = 'open',
          --['<cr>'] = 'open',
          ['o'] = 'open',
          ['<esc>'] = 'revert_preview',
          ['P'] = { 'toggle_preview', config = { use_float = true } },
          ['l'] = 'focus_preview',
          ['S'] = 'open_split',
          ['s'] = 'open_vsplit',
          -- ['S'] = 'split_with_window_picker',
          -- ['s'] = 'vsplit_with_window_picker',
          ['t'] = 'open_tabnew',
          -- ['<cr>'] = 'open_drop',
          -- ['t'] = 'open_tab_drop',
          ['w'] = 'open_with_window_picker',
          --['P'] = 'toggle_preview', -- enter preview mode, which shows the current node without focusing
          ['C'] = 'close_node',
          ['z'] = 'close_all_nodes',
          --['Z'] = 'expand_all_nodes',
          ['a'] = { 
            'add',
            -- this command supports BASH style brace expansion ('x{a,b,c}' -> xa,xb,xc). see `:h neo-tree-file-actions` for details
            -- some commands may take optional config options, see `:h neo-tree-mappings` for details
            config = {
              show_path = 'none' -- 'none', 'relative', 'absolute'
            }
          },
          ['A'] = 'add_directory', -- also accepts the optional config.show_path option like 'add'. this also supports BASH style brace expansion.
          ['d'] = 'delete',
          ['r'] = 'rename',
          ['y'] = 'copy_to_clipboard',
          ['x'] = 'cut_to_clipboard',
          ['p'] = 'paste_from_clipboard',
          ['c'] = 'copy', -- takes text input for destination, also accepts the optional config.show_path option like 'add':
          -- ['c'] = {
          --  'copy',
          --  config = {
          --    show_path = 'none' -- 'none', 'relative', 'absolute'
          --  }
          --}
          ['m'] = 'move', -- takes text input for destination, also accepts the optional config.show_path option like 'add'.
          ['q'] = 'close_window',
          ['R'] = 'refresh',
          ['?'] = 'show_help',
          ['<'] = 'prev_source',
          ['>'] = 'next_source',
        }
      },

      nesting_rules = {},
      filesystem = {
        filtered_items = {
          visible = false, -- when true, they will just be displayed differently than normal items
          hide_dotfiles = true,
          hide_gitignored = false,
          hide_hidden = true, -- only works on Windows for hidden files/directories
          hide_by_name = {
            'node_modules'
          },
          hide_by_pattern = { -- uses glob style patterns
            --'*.meta',
            --'*/src/*/tsconfig.json',
          },
          always_show = { -- remains visible even if other settings would normally hide it
            --'.gitignored',
          },
          never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
            '.DS_Store',
            --'thumbs.db'
          },
          never_show_by_pattern = { -- uses glob style patterns
            --'.null-ls_*',
          },
        },

        follow_current_file = true, -- This will find and focus the file in the active buffer every
                                     -- time the current file is changed while the tree is open.
        group_empty_dirs = true, -- when true, empty folders will be grouped together
        -- hijack_netrw_behavior = 'open_default', -- netrw disabled, opening a directory opens neo-tree
                                                -- in whatever position is specified in window.position
        hijack_netrw_behavior = 'open_current', -- netrw disabled, opening a directory opens within the
                              -- 'open_current',  -- netrw disabled, opening a directory opens within the
                                                -- window like netrw would, regardless of window.position
                              -- 'disabled',    -- netrw left alone, neo-tree does not handle opening dirs
        use_libuv_file_watcher = false, -- This will use the OS level file watchers to detect changes
                                        -- instead of relying on nvim autocmd events.

        window = {
          mappings = {
            ['<bs>'] = 'navigate_up',
            ['.'] = 'set_root',
            ['H'] = 'toggle_hidden',
            ['/'] = 'fuzzy_finder',
            ['D'] = 'fuzzy_finder_directory',
            ['f'] = 'filter_on_submit',
            ['<c-x>'] = 'clear_filter',
            ['[g'] = 'prev_git_modified',
            [']g'] = 'next_git_modified',
          }
        }
      },

      buffers = {
        follow_current_file = true, -- This will find and focus the file in the active buffer every
                                     -- time the current file is changed while the tree is open.
        group_empty_dirs = true, -- when true, empty folders will be grouped together
        show_unloaded = true,
        window = {
          mappings = {
            ['bd'] = 'buffer_delete',
            ['<bs>'] = 'navigate_up',
            ['.'] = 'set_root',
          }
        },
      },

      git_status = {
        window = {
          position = 'float',
          mappings = {
            ['A']  = 'git_add_all',
            ['gu'] = 'git_unstage_file',
            ['ga'] = 'git_add_file',
            ['gr'] = 'git_revert_file',
            ['gc'] = 'git_commit',
            ['gp'] = 'git_push',
            ['gg'] = 'git_commit_and_push',
          }
        }
      }
    })

    vim.cmd([[nnoremap \ :Neotree reveal<cr>]])
  end
}

