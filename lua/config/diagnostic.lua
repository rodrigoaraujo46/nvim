local severity = vim.diagnostic.severity

local signs = {
	[severity.ERROR] = ' ',
	[severity.WARN]  = ' ',
	[severity.INFO]  = ' ',
	[severity.HINT]  = ' '
}

vim.diagnostic.config({
	virtual_text = {
		prefix = function(d)
			return signs[d.severity]
		end
	},
	signs = {
		text = signs,
		numhl = {
			[severity.ERROR] = 'DiagnosticError',
			[severity.WARN]  = 'DiagnosticWarn',
			[severity.INFO]  = 'DiagnosticInfo',
			[severity.HINT]  = 'DiagnosticHint'
		}
	}
})
