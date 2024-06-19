return {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.6',
	dependencies = {
		{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build', lazy = true },
		{ 'nvim-lua/plenary.nvim' },
	},
	cmd = "Telescope",
	keys = {
		{ "<leader>ff", "<cmd>Telescope find_files<CR>",   desc = "Find Files" },
		{ "<leader>ft", "<cmd>Telescope live_grep<CR>",    desc = "Find a string" },
		{ "<leader>fh", "<cmd>Telescope help_tags<CR>",    desc = "Help" },
		{ "<leader>fk", "<cmd>Telescope keymaps<CR>",      desc = "Find keymaps" },
		{ "<leader>fb", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch" },
	},
	config = function()
		require("telescope").setup({
			defaults = {
				file_ignore_patterns = { "node_modules/", ".yarn/", ".git/", ".idea/" },
				extensions = {
					fzf = {
						fuzzy = true, -- false will only do exact matching
						override_generic_sorter = true, -- override the generic sorter
						override_file_sorter = true, -- override the file sorter
						case_mode = "smart_case", -- or "ignore_case" or "respect_case"
					}
				}
			},
			pickers = {
				keymaps = {
					theme = "dropdown", -- Use the dropdown theme
					layout_config = {
						width = 0.5, -- Set the width of the picker
						height = 0.5, -- Set the height of the picker
					},
					previewer = false, -- Disable the previewer
				}
			},
		})
	end,
}
