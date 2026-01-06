vim.pack.add({
	{ src = 'https://github.com/nvim-lualine/lualine.nvim' },
	{ src = 'https://github.com/nvim-tree/nvim-web-devicons' }
})

local lua_rose = require 'lualine.themes.rose-pine-alt'
lua_rose.normal.a.bg = ''
lua_rose.visual.a.bg = ''
lua_rose.insert.a.bg = ''
lua_rose.visual.a.bg = ''
lua_rose.replace.a.bg = ''
lua_rose.command.a.bg = ''

lua_rose.normal.b.bg = ''
lua_rose.normal.c.bg = ''
lua_rose.normal.c.fg = '#9ccfd8'

lua_rose.normal.c.gui = ''
lua_rose.normal.a.gui = 'bold'
lua_rose.normal.b.gui = ''

require 'lualine'.setup({
	options = {
		theme = lua_rose,
		globalstatus = true,
		section_separators = '',
		component_separators = '',
	},
	sections = {
		lualine_a = { { 'mode', padding = { right = 1 } } },
		lualine_b = { { 'tabs', mode = 1 } },
		lualine_c = { { 'branch', icon = '', padding = { left = 2 } } },

		lualine_x = { { 'diff', symbols = { added = ' ', modified = '󰤌 ', removed = ' ' }, padding = { left = 0, right = 2 } }, { 'diagnostics', symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' }, padding = { left = 0, right = 2 } } },
		lualine_y = { { 'filetype', icon_only = true, padding = 0 } },
		lualine_z = {}
	}
})
