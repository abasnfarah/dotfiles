local branch = {
	'branch',
	icons_enabled = true,
	icon = '',
}

local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

local diagnostics = {
	'diagnostics',
	sources = { 'nvim_diagnostic' },
	sections = { 'error', 'warn' },
	symbols = { error = ' ', warn = ' ' },
	colored = false,
	update_in_insert = false,
	always_visible = true,
}

local mode = {
	'mode',
	fmt = function(str)
		return str
	end,
}

local filetype = {
	'filetype',
	icons_enabled = true,
}

local diff = {
	'diff',
	colored = false,
	symbols = { added = ' ', modified = ' ', removed = ' ' }, -- changes diff symbols
  cond = hide_in_width
}

local filename = {
  'filename',
  colored = true,
}

local spaces = function()
	return 'spaces: ' .. vim.api.nvim_buf_get_option(0, 'shiftwidth')
end

return {
  'nvim-lualine/lualine.nvim',
  config = function ()

    require('lualine').setup {
      options = {
        icons_enabled = true,
        theme = 'auto',
        -- component_separators = { left = '', right = ''},
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        -- section_separators = { left = '', right = ''},
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        }
      },
      sections = {
		    -- lualine_a = { branch, diagnostics },
		    lualine_a = {mode},
        lualine_b = {branch, diff, diagnostics, filename},
        lualine_c = {},
        -- lualine_x = {'encoding', 'fileformat', 'filetype'},
		    lualine_x = { spaces, 'encoding', 'fileformat'},
		    lualine_y = {filetype, 'location'},
        lualine_z = {'progress'}
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {filename},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {}
    }

  end
}
