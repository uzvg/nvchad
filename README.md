# nvim

个人 Neovim 配置，基于 [NvChad/starter](https://github.com/NvChad/starter)，使用 lazy.nvim 管理插件。

## 目录结构

| 路径 | 说明 |
| --- | --- |
| `init.lua` | 启动入口：引导 lazy.nvim，加载主题与各模块 |
| `lua/options.lua` | 编辑器选项（缩进、剪贴板等沿用 NvChad 默认） |
| `lua/mappings.lua` | 自定义键位 |
| `lua/chadrc.lua` | 主题（ayu_dark）、透明度与 UI |
| `lua/configs/` | 插件配置：`conform.lua`、`lspconfig.lua`、`lazy.lua` |
| `lua/plugins/` | 插件声明；目录下的每个 `.lua` 会被自动 import，无需索引文件 |

## 常用键位

- `<leader>q`：退出 Neovim（有未保存文件时会询问）
- `<leader>lg`：打开 lazygit
- `<leader>nc`：打开本配置目录
- `<leader>rc` / `<leader>rl` / `<leader>rs`：运行当前文件 / 当前行 / 选中 Lua 代码
- `gco` / `gcO`：在下方 / 上方插入注释并进入插入模式

## 说明

- 格式化：保存时由 conform.nvim 自动执行。Lua 用 stylua，Python 用 ruff，Zsh 用 shfmt，前端与配置文件用 prettierd（缺失时回退 prettier）。
- LSP：使用 Neovim 0.11+ 的 `vim.lsp.config` / `vim.lsp.enable`，服务器通过 Mason 安装。
- 补全：blink.cmp（NvChad 默认的 nvim-cmp 已禁用）。

## 新增插件

在 `lua/plugins/` 下新建文件并返回 lazy.nvim 的 spec 即可。较长的插件配置可以放到 `lua/configs/`，再在 spec 中 `require`。

## Credits

- [NvChad/starter](https://github.com/NvChad/starter)
- [LazyVim](https://github.com/LazyVim/LazyVim)
