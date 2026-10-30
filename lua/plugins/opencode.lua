-- opencode.nvim：在 Neovim 中连接 OpenCode 的 TUI / 服务端
-- 仓库：https://github.com/nickjvandyke/opencode.nvim
-- 当前 opencode 为 v2.x，因此跟随插件 main 分支（支持 OpenCode v2）。
return {
  {
    "nickjvandyke/opencode.nvim",
    branch = "main",
    -- 需要注册事件、autoread 和状态栏，且 lua/configs/lazy.lua 默认 lazy = true，
    -- 所以这里显式改为启动时加载。
    lazy = false,
    config = function()
      vim.g.opencode_opts = require("configs.opencode").opts
    end,
  },
}
