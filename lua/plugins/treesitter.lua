-- nvim-treesitter 的 main 分支（Neovim 0.11+）使用新的安装 API
-- 官方说明该插件不支持懒加载，因此这里显式 lazy = false
local parsers = {
  "bash",
  "css",
  "html",
  "javascript",
  "json",
  "lua",
  "python",
  "ron",
  "tsx",
  "typescript",
  "vim",
  "vimdoc",
  "zsh",
}

return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    -- 覆盖 NvChad 默认的 ":TSUpdate | TSInstallAll"（main 分支已移除 TSInstallAll）
    build = ":TSUpdate",
    config = function(_, opts)
      require("nvim-treesitter").setup(opts)
      require("nvim-treesitter").install(parsers)
    end,
  },
}
