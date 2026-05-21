vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("animus_highlights", {}),
	pattern = "*",
	callback = function()
		vim.hl.hl_op({
			higroup = "IncSearch",
			timeout = 40,
		})
	end,
	desc = "Highlight Yank",
})

vim.api.nvim_create_autocmd("BufWritePre", {
	group = vim.api.nvim_create_augroup("animus_formatting", {}),
	pattern = "*",
	command = [[%s/\s\+$//e]],
	desc = "Remove spaces at the end",
})
