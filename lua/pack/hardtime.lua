vim.pack.add({
	{ src = 'https://github.com/m4xshen/hardtime.nvim' },
	{ src = 'https://github.com/rcarriga/nvim-notify' },
	{ src = 'https://github.com/MunifTanjim/nui.nvim' },
})

local notify = require('notify')
notify.setup({
	background_colour = '#232136',
})

require('hardtime').setup({
	callback = function(text)
		notify(
			text,
			vim.log.levels.WARN,
			{ title = 'Hardtime', timeout = 1000 }
		)
	end
})
