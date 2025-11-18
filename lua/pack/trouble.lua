vim.pack.add({ { src = 'https://github.com/folke/trouble.nvim' } })

local trouble = require 'trouble'
trouble.setup({ auto_close = true })

vim.keymap.set('n', '<leader>tt', function()
	trouble.toggle({ mode = 'diagnostics' })
end, { desc = 'Toggle Trouble' })

vim.keymap.set('n', ']t', function()
	trouble.next({ mode = 'diagnostics', skip_groups = true, jump = true });
end, { desc = 'Next Trouble item' })

vim.keymap.set('n', '[t', function()
	trouble.prev({ mode = 'diagnostics', skip_groups = true, jump = true });
end, { desc = 'Previous Trouble item' })
