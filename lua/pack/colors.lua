vim.pack.add({ { src = "https://github.com/rose-pine/neovim" } })

require("rose-pine").setup({
	dark_variant = "moon",
	extend_background_behind_borders = false,
	styles = { transparency = true, italic = false },
})

vim.cmd("colorscheme rose-pine")
