vim.pack.add({
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
	{ src = "https://github.com/stevearc/oil.nvim" },
})

local oil = require("oil")

oil.setup({
	default_file_explorer = true,
})

vim.keymap.set("n", "<leader>pv", oil.open, { desc = "Open file explorer" })
