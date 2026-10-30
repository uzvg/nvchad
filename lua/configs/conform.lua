-- prettierd 优先，缺失时才回退到 prettier（而不是依次执行两个）
local prettier = { "prettierd", "prettier", stop_after_first = true }

local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    -- shfmt 会自动读取 expandtab / shiftwidth，不需要手动传 -i
    zsh = { "shfmt" },
    python = { "ruff_fix", "ruff_format" },

    css = prettier,
    html = prettier,
    javascript = prettier,
    javascriptreact = prettier,
    typescript = prettier,
    typescriptreact = prettier,
    json = prettier,
    jsonc = prettier,
    yaml = prettier,
    markdown = prettier,
  },

  -- 保存时格式化；没有对应 formatter 的 filetype 回退到 LSP
  format_on_save = {
    timeout_ms = 500,
    lsp_format = "fallback",
  },
}

return options
