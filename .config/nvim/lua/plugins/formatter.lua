return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
			    python = { "isort", "black" },
			    c = { "clang_format" },
			    cpp = { "clang_format" },
			    sh = { "shfmt" },
			},
			formatters = {
				clang_format = {
					args = { "-style={IndentWidth: 4}" },
				},
				shfmt = {
					args = { "-filename", "$FILENAME", "-i=4" },
				},
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
