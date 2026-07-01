vim.keymap.set("n", "<leader><leader>", vim.cmd.source, { desc = "Source current file" })
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to system clip" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Yank to system clip" })
vim.keymap.set("v", "<leader>p", [["_dP]], { desc = "Paste and keep" })
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete and keep" })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line up" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line down" })
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join but cursor stays" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Down and center" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Up and center" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Match and center" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous match and center" })
vim.keymap.set("i", "<C-c>", "<Esc>", { desc = "Leave insert without interrupt" })
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make file executable" })
vim.keymap.set(
	"n",
	"<leader>s",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "Replace current word" }
)

vim.keymap.set("n", "<C-f>", function()
	local width = math.floor(vim.o.columns * 0.8)
	local height = math.floor(vim.o.lines * 0.6)
	local col = math.floor((vim.o.columns - width) / 2)
	local row = math.floor((vim.o.lines - height) / 2)

	local buf = vim.api.nvim_create_buf(false, true)
	local win = vim.api.nvim_open_win(buf, true, {
		relative = "editor",
		width = width,
		height = height,
		col = col,
		row = row,
	})

	vim.cmd("term haunt")
	vim.cmd("startinsert")

	vim.api.nvim_create_autocmd("TermClose", {
		buffer = buf,
		once = true,
		callback = function()
			vim.api.nvim_win_close(win, true)
			vim.api.nvim_buf_delete(buf, { force = true })
		end,
	})
end, { desc = "Run haunt" })
