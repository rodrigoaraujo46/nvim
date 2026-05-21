vim.pack.add({ { src = "http://github.com/mfussenegger/nvim-lint" } })

local lint = require("lint")
lint.linters_by_ft = {
	go = { "golangcilint" },
	gitcommit = { "gitlint" },
}

vim.api.nvim_create_autocmd({ "BufRead", "InsertLeave", "BufWritePost" }, {
	group = vim.api.nvim_create_augroup("animus_lint", {}),
	callback = function()
		lint.try_lint()
	end,
})
