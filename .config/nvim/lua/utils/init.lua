local M = {}

M.servers = {
  "lua_ls",
  "cssls",
  "html",
  "bashls",
  "jsonls",
  "yamlls",
  "gopls",
  "pylsp",
  "clangd",
  "eslint"
}

M.linters = {
  "prettier",
  "stylua",
  "black",
}

M.parsers = {
  "lua",
  "vim",
  "markdown",
  "markdown_inline",
  "latex",
  "bash",
  "python",
  "cpp",
  "c",
  "html",
  "css",
  "json",
  "yaml",
  "toml",
  "regex",
  "gd",
  "go",
  "rust",
  "dockerfile",
}

return M
