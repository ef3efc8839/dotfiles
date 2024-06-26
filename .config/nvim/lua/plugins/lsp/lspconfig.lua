return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
	},

	config = function() -- import lspconfig plugin
		local lspconfig = require("lspconfig")
		-- import cmp-nvim-lsp plugin
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local keymap = vim.keymap -- for conciseness

		local opts = { noremap = true, silent = true }
		local on_attach = function(client, bufnr)
			opts.buffer = bufnr

			-- set keybinds
			opts.desc = "LSP show references"
			keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

			opts.desc = "LSP go to declaration"
			keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

			opts.desc = "LSP show definitions"
			keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

			opts.desc = "LSP show implementations"
			keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

			opts.desc = "LSP show type definitions"
			keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

			opts.desc = "LSP see available code actions"
			keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

			opts.desc = "LSP show buffer diagnostics"
			keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

			opts.desc = "LSP show line diagnostics"
			keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

			opts.desc = "LSP go to previous diagnostic"
			keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

			opts.desc = "LSP go to next diagnostic"
			keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

			opts.desc = "LSP show documentation for what is under cursor"
			keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor
		end

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		local util = require("lspconfig.util")
		-- settings for python server
		lspconfig["pyright"].setup({
			cmd = { "pyright-langserver", "--stdio" },
			filetypes = { "python" },
			capabilities = capabilities,
			on_attach = on_attach,
			python = {
				analysis = {
					autoSearchPaths = true,
					diagnosticMode = "openFilesOnly",
					useLibraryCodeForTypes = true,
				},
			},
			single_file_support = true,
		})

		-- settings for bashls
		lspconfig["bashls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			cmd = { 'bash-language-server', 'start' },
			settings = {
			  bashIde = {
			    -- Glob pattern for finding and parsing shell script files in the workspace.
			    -- Used by the background analysis features across files.

			    -- Prevent recursive scanning which will cause issues when opening a file
			    -- directly in the home directory (e.g. ~/foo.sh).
			    --
			    -- Default upstream pattern is "**/*@(.sh|.inc|.bash|.command)".
			    globPattern = vim.env.GLOB_PATTERN or '*@(.sh|.inc|.bash|.command)',
			  },
			},
			filetypes = { 'sh' },
			root_dir = util.find_git_ancestor,
			single_file_support = true,
		})

		local root_files = {
			".clangd",
			".clang-tidy",
			".clang-format",
			"compile_commands.json",
			"compile_flags.txt",
			"configure.ac",
			".git",
		}

		-- settings for clangd server
		lspconfig["clangd"].setup({
			cmd = { "clangd" },
			filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
			root_dir = function(fname)
				return util.root_pattern(unpack(root_files))(fname) or util.find_git_ancestor(fname)
			end,
			single_file_support = true,
			capabilities = capabilities,
			on_attach = on_attach,
		})
	end,
}
