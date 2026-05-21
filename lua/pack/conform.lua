vim.pack.add({ { src = "http://github.com/stevearc/conform.nvim" } })

local conform = require("conform")

local options = {
	formatters = {
		gofumpt = {
			append_args = { "-extra" },
			env = {
				GOFUMPT_SPLIT_LONG_LINES = "on",
			},
		},
		["biome-check"] = { require_cwd = true },
	},
	formatters_by_ft = {
		go = { "goimports", "gofumpt" },
		lua = { "stylua" },
		["_"] = { lsp_format = "fallback" },
	},
	format_on_save = true,
}

---@param filetypes string[]
---@param formatters table
local function share_formatters(filetypes, formatters)
	for _, type in ipairs(filetypes) do
		options.formatters_by_ft[type] = formatters
	end
end

share_formatters({
	"astro",
	"css",
	"graphql",
	"html",
	"javascript",
	"javascriptreact",
	"json",
	"jsonc",
	"svelte",
	"typescript",
	"typescriptreact",
	"vue",
}, { "biome-check", "biome", stop_after_first = true })

conform.setup(options)

vim.keymap.set({ "n", "v" }, "<leader>f", function()
	conform.format()
end, { desc = "Format" })
