vim.pack.add({
	{ src = 'https://github.com/nvim-treesitter/nvim-treesitter' },
	{ src = 'https://github.com/nvim-treesitter/nvim-treesitter-textobjects', version = 'main' }
})

vim.api.nvim_create_autocmd('FileType', {
	callback = function(args)
		local treesitter = require('nvim-treesitter')
		local lang = vim.treesitter.language.get_lang(args.match)
		if vim.list_contains(treesitter.get_available(), lang) then
			if not vim.list_contains(treesitter.get_installed(), lang) then
				treesitter.install(lang):wait()
			end
			vim.treesitter.start(args.buf)
		end
	end,
	desc = 'Enable nvim-treesitter and install parser if not installed'
})

local textobjects = require 'nvim-treesitter-textobjects.select'

vim.keymap.set({ 'x', 'o' }, 'af', function()
	textobjects.select_textobject('@function.outer', 'textobjects')
end, { desc = 'Around function textobject' })

vim.keymap.set({ 'x', 'o' }, 'if', function()
	textobjects.select_textobject('@function.inner', 'textobjects')
end, { desc = 'Inside function textobject' })

vim.keymap.set({ 'x', 'o' }, 'ac', function()
	textobjects.select_textobject('@class.outer', 'textobjects')
end, { desc = 'Around class textobject' })

vim.keymap.set({ 'x', 'o' }, 'ic', function()
	textobjects.select_textobject('@class.inner', 'textobjects')
end, { desc = 'Inside class textoject' })
