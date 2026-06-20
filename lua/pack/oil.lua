vim.pack.add({
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
	{ src = "https://github.com/stevearc/oil.nvim" },
})

local oil = require("oil")

oil.setup({
	default_file_explorer = true,
	delete_to_trash = true,
	skip_confirm_for_simple_edits = true,
	view_options = {
		show_hidden = true,
	},
	keymaps = {
		["<C-p>"] = false,
	},
})

vim.keymap.set("n", "-", oil.open, { desc = "Open file explorer" })
