local opts = { buf = 0, silent = true }

opts.desc = "Golang error statement"
vim.keymap.set("n", "<leader>ee", "oif err != nil {<CR>}<Esc>Oreturn err<Esc>", opts)

opts.desc = "Golang assert error"
vim.keymap.set("n", "<leader>ea", 'oassert.NoError(err, "")<Esc>F";a', opts)

opts.desc = "Golang log error"
vim.keymap.set("n", "<leader>el", 'oif err != nil {<CR>}<Esc>O.logger.Error("error", "error", err)<Esc>F.;i', opts)
