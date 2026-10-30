-- 格式化工具 conform.nvim
return {
  {
    "stevearc/conform.nvim",
    -- 在写入前加载插件，配合 configs/conform.lua 的 format_on_save 实现保存时格式化
    event = "BufWritePre",
    cmd = "ConformInfo",
    opts = require "configs.conform",
  },
}
