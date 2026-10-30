local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    zsh = { "shfmt" },
    python = { "ruff_fix", "ruff_format" },
    css = { "prettierd", "prettier" },
    html = { "prettierd", "prettier" },
    javascript = { "prettierd", "prettier" },
    javascriptreact = { "prettierd", "prettier" },
    typescript = { "prettierd", "prettier" },
    typescriptreact = { "prettierd", "prettier" },
    json = { "prettierd", "prettier" },
    jsonc = { "prettierd", "prettier" },
    yaml = { "prettierd", "prettier" },
    markdown = { "prettierd", "prettier" },
  },

  -- formatters = {
  --   shfmt = {
  --     -- -i 2 表示缩进为 2
  --     args = { "-i", "2", "-" },
  --   },
  -- },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
