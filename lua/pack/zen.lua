vim.pack.add({ { src = "https://github.com/folke/zen-mode.nvim" } })
local zen = require("zen-mode")

local on_toggle = function(win)
	local action = (win == nil) and "unset" or "set"
	local cmd = string.format([[hyprctl dispatch 'hl.dsp.window.fullscreen({action=%q})']], action)

	vim.fn.system(cmd)
end

zen.setup({
	plugins = {
		options = { laststatus = 0 },
	},
	on_open = on_toggle,
	on_close = on_toggle,
})

vim.keymap.set("n", "<leader>zz", function()
	local count = vim.v.count == 0 and 100
	if count == 0 then
		count = 100
	end
	if count < 80 then
		count = 80
	end

	zen.toggle({ window = { width = count } })
end, { desc = "toggle zen-mode" })
