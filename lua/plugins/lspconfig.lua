-- LSP 相关配置（具体服务器列表见 configs/lspconfig.lua）
return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
    -- 说明：NvChad 默认会给 nvim-lspconfig 加上 event = "User FilePost"，
    -- lazy.nvim 合并 spec 时该加载时机会被保留，因此这里无需重复声明
  },
}
