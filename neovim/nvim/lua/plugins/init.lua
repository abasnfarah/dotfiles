return {
  -- Simple plugins can be specified as stringsd
  -- 'rstacruz/vim-closer',

  -- Base plugins used by a lot of other plugins
  'nvim-lua/popup.nvim',
  'nvim-lua/plenary.nvim',

  -- ColorSchemes
  'ellisonleao/gruvbox.nvim',
  'lunarvim/darkplus.nvim',
  'rebelot/kanagawa.nvim',

  -- tools
  'tpope/vim-surround', -- Awesome plugin for surround tags

  -- Go
  'fatih/vim-go',

  -- Tmux and vim integration
  -- 'alexghergh/nvim-tmux-navigation',

  -- cmp plugins
  --'hrsh7th/nvim-cmp',

  -- install without yarn or npm
  {
      'iamcco/markdown-preview.nvim',
      build = function() vim.fn['mkdp#util#install']() end,
  },

  -- Git --
  'airblade/vim-gitgutter',

  -- Copilot --
  'github/copilot.vim'

}
