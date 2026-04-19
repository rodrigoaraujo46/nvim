vim.pack.add({ { src = "http://github.com/tpope/vim-fugitive" } })

vim.api.nvim_create_autocmd("User", {
	group = vim.api.nvim_create_augroup("fugitive_group", {}),
	pattern = "FugitiveIndex",
	callback = function()
		vim.keymap.set("n", "<leader>p", function()
			vim.cmd.Git("push")
		end, { buf = 0, desc = "Fugitive push" })

		vim.keymap.set("n", "<leader>P", function()
			vim.cmd.Git({ "pull", "--rebase" })
		end, { buf = 0, desc = "Fugite pull" })

		vim.keymap.set("n", "<leader>t", ":Git push -u origin ", { buf = 0, desc = "Fugitive push with remote" })
	end,
})

vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Git status" })
vim.keymap.set("n", "gu", "<cmd>diffget //2<CR>", { desc = "diffget left " })
vim.keymap.set("n", "gh", "<cmd>diffget //3<CR>", { desc = "diffget right" })
