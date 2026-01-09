vim.pack.add({ { src = 'https://github.com/zbirenbaum/copilot.lua' } })

require('copilot').setup({
	suggestion = { auto_trigger = true }
})

local suggestionn = require('copilot.suggestion')
vim.keymap.set('i', '<Tab>', function()
	if suggestionn.is_visible() then
		suggestionn.accept_line()
	else
		return '<Tab>'
	end
end, { expr = true, silent = true, desc = 'Copilot accept line' })

vim.keymap.set('i', '<S-Tab>', function()
	if suggestionn.is_visible() then
		suggestionn.accept()
	else
		return '<S-Tab>'
	end
end, { expr = true, silent = true, desc = 'Copilot accept all' })
