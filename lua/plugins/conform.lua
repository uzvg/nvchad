-- 格式化工具 conform.nvim
return {
  {
    "stevearc/conform.nvim",
    -- 在写入前加载插件，配合 configs/conform.lua 里的 format_on_save 实现保存时自动格式化
    event = "BufWritePre",
    -- 注意：因为插件依赖 BufWritePre 这个事件才被加载，
    -- 所以每次启动 Neovim 后的第一次保存不会触发格式化
    opts = require "configs.conform",
  },
}
