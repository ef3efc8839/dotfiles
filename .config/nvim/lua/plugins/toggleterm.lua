return {
    'akinsho/toggleterm.nvim',
    config = function()
	local toggleterm = require("toggleterm")

	toggleterm.setup({
	    size = 5,
	    open_mapping = [[<c-f>]],
	    hide_numbers = true,
	    start_in_insert = true,
	    insert_mappings = true,
	    presist_size = true,
	    direction = "float",
	    close_on_exit = true,
	    shell = vim.o.shell,
	    float_opts = {
		border = "curved",
		winblend = 0,
		highlights = {
		    border = "Normal",
		    background = "Normal",
		},
	    },
	})
    end
}
