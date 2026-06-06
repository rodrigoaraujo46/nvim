vim.pack.add({
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects" },
})

local async = require("nvim-treesitter.async")
local ts = require("nvim-treesitter")
local install = require("nvim-treesitter.install")

vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("animus_treesitter", {}),
	callback = function(args)
		local lang = vim.treesitter.language.get_lang(args.match)
		if vim.list_contains(ts.get_available(), lang) then
			async.async(function()
				async.await(install.install, lang)
				vim.treesitter.start(args.buf, lang)
			end)()
		end
	end,
	desc = "install parsers and start treesitter",
})

local sto = require("nvim-treesitter-textobjects.select").select_textobject
local modes = { "x", "o" }

vim.keymap.set(modes, "af", function()
	sto("@function.outer", "textobjects")
end, { desc = "Around function textobject" })

vim.keymap.set(modes, "if", function()
	sto("@function.inner", "textobjects")
end, { desc = "Inside function textobject" })

vim.keymap.set(modes, "ac", function()
	sto("@class.outer", "textobjects")
end, { desc = "Around class textobject" })

vim.keymap.set(modes, "ic", function()
	sto("@class.inner", "textobjects")
end, { desc = "Inside class textoject" })

vim.keymap.set(modes, "ii", function()
	sto("@conditional.inner", "textobjects")
end, { desc = "Inside conditional textoject" })

vim.keymap.set(modes, "ai", function()
	sto("@conditional.outer", "textobjects")
end, { desc = "Around conditional textobject" })
