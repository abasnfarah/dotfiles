require("abas.options")
require("abas.keymaps")
require("abas.lazy")
require("abas.markdown")

-- This saves buffer folds on exit and loads them on open
vim.cmd("autocmd VimLeave * mkview")
vim.cmd("autocmd BufWinEnter * silent! loadview")

vim.o.background = "dark"
vim.cmd([[colorscheme catppuccin]])
-- vim.cmd([[colorscheme darkplus]])
