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
		lualine_a = { { 'mode', padding = 0 } },
		lualine_b = { 'filename' },
		lualine_c = { { 'branch', icon = '' } },

		lualine_x = { { 'diff', symbols = { added = ' ', modified = ' ', removed = ' ' } }, { 'diagnostics', symbols = { error = ' ', warn = ' ', info = ' ', hint = ' '} } },
		lualine_y = { { 'filetype', icon_only = true, padding = 0 } },
		lualine_z = {}
	}
})
