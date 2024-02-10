local remap = vim.api.nvim_set_keymap

remap('', '<Space>', '<Nop>', { noremap = true, silent = true, desc = 'Leader key nop'})
local opts = {noremap = true, silent = true}

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

function mergeOpts(t1, t2)
  for k,v in pairs(t2) do
    t1[k] = v
  end
  return t1
end

--------------------------------------------------------------------
--  _   _                            _   __  __           _       -- 
-- | \ | | ___  _ __ _ __ ___   __ _| | |  \/  | ___   __| | ___  -- 
-- |  \| |/ _ \| '__| '_ ` _ \ / _` | | | |\/| |/ _ \ / _` |/ _ \ -- 
-- | |\  | (_) | |  | | | | | | (_| | | | |  | | (_) | (_| |  __/ -- 
-- |_| \_|\___/|_|  |_| |_| |_|\__,_|_| |_|  |_|\___/ \__,_|\___| -- 
--                                                                --   
--------------------------------------------------------------------

--find and replace
remap("n", "<leader>sr", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", { noremap = true, silent = true, desc= '[S]earch and [R]eplace'})

-- Let's us navigate panes using ctrl+vim movement
-- remap('n', '<C-h>', '<C-w>h', { noremap = true, silent = true, desc = 'Move to left pane'})
remap('n', '<C-h>', '<C-w>h', mergeOpts(opts, { desc = 'Move to left pane' }))
remap('n', '<C-j>', '<C-w>j', mergeOpts(opts, { desc = 'Move to lower pane' }))
remap('n', '<C-k>', '<C-w>k', mergeOpts(opts, { desc = 'Move to upper pane' }))
remap('n', '<C-l>', '<C-w>l', mergeOpts(opts, { desc = 'Move to right pane' }))

-- keep cursor centered when searching
remap('n', 'n', 'nzzzv', opts)
remap('n', 'N', 'Nzzzv', opts)

-- Split windows
remap('n', '<leader>|', ':vsplit<CR>', mergeOpts(opts, { desc = 'Split window [|]vertically' }))
remap('n', '<leader>-', ':split<CR>', mergeOpts(opts, { desc = 'Split window [-]horizontally' }))

-- remap('n', '<leader>e', ':Lexplore 30<cr>', { noremap = true, silent = true })

-- Resize panes remap
remap('n', '<leader>j', ':resize -3<CR>', mergeOpts(opts, { desc = 'resize window 3 lines down' }))
remap('n', '<leader>k', ':resize +3<CR>', mergeOpts(opts, { desc = 'resize window 3 lines up' }))
remap('n', '<leader>h', ':vertical resize -3<CR>', mergeOpts(opts, { desc = 'resize window 3 lines left' }))
remap('n', '<leader>l', ':vertical resize +3<CR>', mergeOpts(opts, { desc = 'resize window 3 lines right' }))

-- Resize panes remap using arrow keys
remap('n', '<C-Up>', ':resize -2<CR>', mergeOpts(opts, { desc = 'resize window 2 lines down' }))
remap('n', '<C-Down>', ':resize +2<CR>', mergeOpts(opts, { desc = 'resize window 2 lines up' }))
remap('n', '<C-Left>', ':vertical resize -2<CR>', mergeOpts(opts, { desc = 'resize window 2 lines left' }))
remap('n', '<C-Right>', ':vertical resize +2<CR>', mergeOpts(opts, { desc = 'resize window 2 lines right' }))

-- Move panes around remap
remap('n', '<leader>wl', '<C-w>L', mergeOpts(opts, { desc = 'Move window RIGHT' }))
remap('n', '<leader>wh', '<C-w>H', mergeOpts(opts, { desc = 'Move window LEFT' }))
remap('n', '<leader>wj', '<C-w>J', mergeOpts(opts, { desc = 'Move window DOWN' }))
remap('n', '<leader>wk', '<C-w>K', mergeOpts(opts, { desc = 'move window UP' }))

-- Navigate buffers
remap('n', '<S-l>', ':bnext<CR>', mergeOpts(opts, { desc = 'Move to next Buffer' }))
remap('n', '<S-h>', ':bprevious<CR>', mergeOpts(opts, { desc = 'Move to previous Buffer' }))

-- Markdown Preview
remap('n', '<leader>md', '<Plug>MarkdownPreview', mergeOpts(opts, { desc = '[M]ark[D]own preview' }))
remap('n', '<leader>mds', '<Plug>MarkdownPreviewStop', mergeOpts(opts, { desc = '[M]ark[D]own preview [S]top' }))
remap('n', '<leader>mdt', '<Plug>MarkdownPreviewToggle', mergeOpts(opts, { desc = '[M]ark[D]own preview [T]oggle' }))

-- Markdown Preview
remap('n', '<leader>bd', ':bdelete<cr>', mergeOpts(opts, { desc = '[B]uffer [D]elete' }))

-- Lazy plugin manager
remap('n', '<leader>p', ':Lazy<cr>', mergeOpts(opts, { desc = 'Lazy loader' }))

-- Vim Tmux Navigation
-- remap('n', '<silent> <C-h>', '<Cmd>NvimTmuxNavigateLeft<CR>', opts)
-- remap('n', '<silent> <C-j>', '<Cmd>NvimTmuxNavigateDown<CR>', opts)
-- remap('n', '<silent> <C-k>', '<Cmd>NvimTmuxNavigateUp<CR>', opts)
-- remap('n', '<silent> <C-l>', '<Cmd>NvimTmuxNavigateRight<CR>', opts)

-- Movment remaps to deal with wordwrap
remap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true, desc = 'Fixes word wrapping for k'})
remap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true, desc = 'Fixes word wrapping for j'})

-- Git 
remap('n', '<leader>gs', ':Neotree git_status<CR>', mergeOpts(opts, { desc = 'Neotree [G]it [S]tatus' }))

-- Error
remap('n', '<leader>E', ':lua vim.diagnostic.open_float(0, {scope="line"})<CR>',mergeOpts(opts, { desc = 'Show [E]rror in window' }))

-- Golang if err != nil
remap('n', '<leader>se', 'oif err != nil {<CR>}<Esc>Oreturn err<Esc>',mergeOpts(opts, { desc = 'Golang [S]nippit if [e]rr != nil snippit' }))

-- remove noice.nvim messages
remap('n', '<leader>nd', '<cmd>NoiceDismiss<CR>', mergeOpts(opts, { desc = 'Dismiss noice.nvim messages' }))

--------------------------------------------------------------------
--      ___                     _     __  __           _          --
--     |_ _|_ __  ___  ___ _ __| |_  |  \/  | ___   __| | ___     --
--      | || '_ \/ __|/ _ \ '__| __| | |\/| |/ _ \ / _` |/ _ \    --
--      | || | | \__ \  __/ |  | |_  | |  | | (_) | (_| |  __/    --
--     |___|_| |_|___/\___|_|   \__| |_|  |_|\___/ \__,_|\___|    --
--                                                                --
--------------------------------------------------------------------

-- Press jk fast to exit insert mode 
-- remap('i', 'jk', '<ESC>', mergeOpts(opts, { desc = 'jk for extra fast insert mode exit' }))
remap('i', 'kj', '<ESC>', mergeOpts(opts, { desc = 'kj for extra fast insert mode exit' }))

-- Navigate while in insert mode

-- copilot
vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-j>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

--------------------------------------------------------------------
--      __     ___                 _   __  __           _         --
--      \ \   / (_)___ _   _  __ _| | |  \/  | ___   __| | ___    --
--       \ \ / /| / __| | | |/ _` | | | |\/| |/ _ \ / _` |/ _ \   --
--        \ V / | \__ \ |_| | (_| | | | |  | | (_) | (_| |  __/   --
--         \_/  |_|___/\__,_|\__,_|_| |_|  |_|\___/ \__,_|\___|   --
--                                                                --
--------------------------------------------------------------------

-- Stay in indent mode
remap('v', '<', '<gv', mergeOpts(opts, { desc = 'Stay in visual mode after indenting with <' }))
remap('v', '>', '>gv', mergeOpts(opts, { desc = 'Stay in visual mode after indenting with >' }))

-- Move text up and down
remap('v', 'p', '\'_dP', mergeOpts(opts, { desc = 'Move text up and down' }))

-- Visual Block
-- Move text up and down
remap('x', 'J', ':move \'>+1<CR>gv-gv', mergeOpts(opts, { desc = 'Move text up in using J in visual mode' }))
remap('x', 'K', ':move \'<-2<CR>gv-gv', mergeOpts(opts, { desc = 'Move text down in using K in visual mode' }))

