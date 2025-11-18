vim.pack.add({
	{ src = 'https://github.com/rose-pine/neovim' },
})

require 'rose-pine'.setup({
	variant = 'auto',
	dark_variant = 'moon',
	extend_background_behind_borders = false,
	styles = { transparency = true },
})

ColorMyPencils = {
	rose_pine = function() ColorMyPencils('rose-pine') end,
}

function ColorMyPencils:__call(color)
	if type(color) == 'function' then
		color()
		return
	elseif type(color) ~= 'string' then
		vim.notify('Invalid color', vim.log.levels.WARN)
		return
	end

	vim.cmd('colorscheme ' .. color)

	local f = io.open('/home/animus/.config/nvim/.color', 'w')
	if f then
		f:write(color); f:close()
	end
end

setmetatable(ColorMyPencils, { __call = ColorMyPencils.__call })

local f = io.open('/home/animus/.config/nvim/.color')
if f then
	local last = f:read('*l')
	f:close()
	if last and #last > 0 then
		ColorMyPencils(last)
	end
end
