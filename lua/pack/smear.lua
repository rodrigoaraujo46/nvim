vim.pack.add({ { src = 'https://github.com/sphamba/smear-cursor.nvim' } })

require('smear_cursor').setup({
	cursor_color = Colors.text,
	distance_stop_animating_vertical_bar = 0.1,
	stiffness = 0.5,
	trailing_stiffness = 0.5,
	matrix_pixel_threshold = 0.5,
})
