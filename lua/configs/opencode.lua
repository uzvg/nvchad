-- opencode.nvim 配置
-- 仓库：https://github.com/nickjvandyke/opencode.nvim
-- 完整选项与默认值见插件内的 lua/opencode/config.lua

local M = {}

-- 复用 NvChad 的终端模块：TUI 在右侧垂直分屏里运行，
-- 再次触发时可以直接显示 / 隐藏同一个终端，而不是新建进程。
-- OpenCode v2 默认连接后台服务，不需要再传 --port。
M.term = {
  pos = "vsp",
  id = "opencode",
  cmd = "opencode",
  size = 0.3,
}

function M.toggle()
  require("nvchad.term").toggle(M.term)
end

---@type opencode.Opts
M.opts = {
  server = {
    -- 没有找到正在运行的 OpenCode 服务时，启动一个集成终端。
    -- 启动后把焦点还给原来的窗口，避免打断编辑。
    start = function()
      require("nvchad.term").new(M.term)
      vim.cmd "wincmd p"
    end,
  },
}

return M
