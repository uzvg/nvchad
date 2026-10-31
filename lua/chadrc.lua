-- 结构参考：https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "ayu_dark",
  transparency = true,

  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
    CursorLine = { bg = "black2" },
  },
}

-- 仅在连接到 OpenCode 服务时显示图标和地址；pcall 避免插件尚未加载时报错
local function opencode_status()
  local ok, status = pcall(function()
    if not require("opencode.server").connected then
      return ""
    end
    return require("opencode").statusline()
  end)

  return ok and status ~= "" and ("%#St_Lsp# " .. status .. " ") or ""
end

-- 启动时（打开空 buffer）自动显示 Nvdash 首页
M.nvdash = {
  load_on_startup = true,
}

M.ui = {
  statusline = {
    separator_style = "round",
    order = { "mode", "file", "git", "%=", "lsp_msg", "%=", "diagnostics", "lsp", "opencode", "cwd", "cursor" },
    modules = {
      opencode = opencode_status,
    },
  },
}

return M
