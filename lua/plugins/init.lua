-- 用户自定义插件入口（索引）
-- 说明：根目录 init.lua 里的 `{ import = "plugins" }` 会自动加载本目录下的所有 .lua 文件，
-- 这里再显式 import 是为了让各插件的加载顺序和归属一目了然
return {
  { import = "plugins.conform" },
  { import = "plugins.lspconfig" },
  { import = "plugins.blink" },
  { import = "plugins.treesitter" },
  { import = "plugins.lazygit" },
  { import = "plugins.ibus-rime-remote" },
}
