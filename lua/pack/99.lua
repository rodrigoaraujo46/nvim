vim.pack.add({ { src = 'https://github.com/ThePrimeagen/99' } })

_99 = require('99')

_99.setup({
	model = 'opencode/big-pickle',
	md_files = {
		'AGENT.md',
	},
})

vim.keymap.set('n', '<leader>9f', function()
	_99.fill_in_function()
end, { desc = '99 Fill in function' })

vim.keymap.set('v', '<leader>9v', function()
	_99.visual()
end, { desc = '99 Visual Fill' })

vim.keymap.set('v', '<leader>9s', function()
	_99.stop_all_requests()
end, { desc = '99 Stop all requests' })
