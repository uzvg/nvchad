-- ibus-rime-remote.nvim：根据模式自动切换 Rime 输入法的 ascii_mode（中/英）
-- 仓库：https://github.com/uzvg/ibus-rime-remote.nvim
-- 本地开发目录：/home/uzvg/Projects/ibus-rime-remote.nvim
--   （想直接用本地改动调试时，可改用 dir = "…"，或在本插件里加 dev = true）
return {
  {
    "uzvg/ibus-rime-remote.nvim",
    -- 需要在 InsertLeave / InsertEnter 上立即生效，不能懒加载
    lazy = false,
    enabled = false,
    -- 默认配置即可；需要自定义时：
    -- opts = { bin = "/home/uzvg/.local/bin/ibus-rime-remote", ignore_macro = true },
    opts = {},
  },
}
