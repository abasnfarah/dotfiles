return {
  "nvim-telescope/telescope-fzf-native.nvim",
  build = "make",
  cond = function()
    return vim.fn.executable("make") == 1
  end,
}
