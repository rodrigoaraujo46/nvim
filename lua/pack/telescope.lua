vim.pack.add({
	{ src = 'https://github.com/nvim-lua/plenary.nvim' },
	{ src = 'https://github.com/nvim-telescope/telescope.nvim', version = 'v0.1.9' }
})

local builtin = require('telescope.builtin')
local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')

local original_colorscheme = builtin.colorscheme
builtin.colorscheme = function(opts)
	opts = opts or {}
	local original_attach = opts.attach_mappings

	opts.attach_mappings = function(prompt_bufnr, map)
		map('i', '<CR>', function()
			local selection = action_state.get_selected_entry()
			if selection and selection.value then
				ColorMyPencils(selection.value)
			end
			actions.close(prompt_bufnr)
		end, { desc = 'Set colorscheme' })

		if original_attach then
			return original_attach(prompt_bufnr, map)
		end
		return true
	end

	original_colorscheme(opts)
end

vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Fuzzy files' })

vim.keymap.set('n', '<leader>ph', function()
	builtin.find_files({ hidden = true, no_ignore = true })
end, { desc = 'Fuzzy hidden files' })

vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Fuzzy git files' })

vim.keymap.set('n', '<leader>pws', function()
	local word = vim.fn.expand('<cword>')
	builtin.grep_string({ search = word })
end, { desc = 'Grep current word' })

vim.keymap.set('n', '<leader>pWs', function()
	local word = vim.fn.expand('<cWORD>')
	builtin.grep_string({ search = word })
end, { desc = 'Grep current WORD' })

vim.keymap.set('n', '<leader>ps', builtin.live_grep, { desc = 'Live grep' })
vim.keymap.set('n', '<leader>vh', builtin.help_tags, { desc = 'Telescope help' })
