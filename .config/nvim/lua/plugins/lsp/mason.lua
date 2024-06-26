return {
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
		config = function()
			local mason = require("mason")
			local mason_lspconfig = require("mason-lspconfig")
			local mason_tool_installer = require("mason-tool-installer")

			mason.setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})

			mason_lspconfig.setup({
				-- list of servers for mason to install
				ensure_installed = {
					"pyright",
					"clangd",
					"bashls",
				},
			})

			mason_tool_installer.setup({
				ensure_installed = {
				    "isort", -- python formatter
				    "black", -- python formatter
				    "clang-format", -- C/C++... formatter
				    "shfmt", -- bash formatter

				    "pylint", -- python linter
				},
			})
		end,
	},
}
