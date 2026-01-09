vim.pack.add({ { src = 'http://github.com/stevearc/conform.nvim' } })

local conform = require('conform')
conform.setup({
	default_format_opts = {
		lsp_format = 'fallback',
	},
	formatters = {
		gofumpt = {
			append_args = { '-extra' },
			env = {
				GOFUMPT_SPLIT_LONG_LINES = 'on'
			}
		},
	},
	formatters_by_ft = {
		go = { 'goimports', 'gofumpt' },
	}
})

vim.keymap.set('n', '<leader>f', function()
	conform.format()
end, { desc = 'Format using conform' })
