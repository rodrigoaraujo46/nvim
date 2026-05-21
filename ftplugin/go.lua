vim.keymap.set(
	"n",
	"<leader>ee",
	"oif err != nil {<CR>}<Esc>Oreturn err<Esc>",
	{ buf = 0, desc = "Golang error statement" }
)
vim.keymap.set(
	"n",
	"<leader>el",
	'oif err != nil {<CR>}<Esc>O.logger.Error("error", "error", err)<Esc>F.;i',
	{ buf = 0, desc = "Golang log error" }
)
vim.keymap.set("n", "<leader>ea", 'oassert.NoError(err, "")<Esc>F";a', { buf = 0, desc = "Golang assert error" })
