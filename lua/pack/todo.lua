vim.pack.add({
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/folke/todo-comments.nvim" },
})

require("todo-comments").setup({
	signs = true,
	keywords = {
		FIX = { icon = " " },
		TODO = { icon = "󰡕 " },
		HACK = { icon = "󰶯 " },
		WARN = { icon = " " },
		PERF = { icon = "󰅒 " },
		NOTE = { icon = " " },
		TEST = { icon = "󰂓 " },
	},
	colors = {
		error = "@comment.error",
		warning = "@comment.warning",
		info = "@comment.todo",
		hint = "@comment.hint",
		default = "@comment.info",
		test = "@comment.note",
	},
})
