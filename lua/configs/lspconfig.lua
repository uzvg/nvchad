require("nvchad.configs.lspconfig").defaults()

-- bashls 默认不包含 zsh
vim.lsp.config("bashls", { filetypes = { "bash", "sh", "zsh" } })

-- 其余服务器直接使用 nvim-lspconfig 的默认配置
-- 文档：:h vim.lsp.config
vim.lsp.enable {
  "bashls",
  "basedpyright",
  "cssls",
  "html",
  "lua_ls",
  "markdown_oxide",
  "ruff",
}
