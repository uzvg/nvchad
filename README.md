# nvim

个人 Neovim 配置，基于 [NvChad/starter](https://github.com/NvChad/starter)，使用 lazy.nvim 管理插件。

## 目录结构

| 路径 | 说明 |
| --- | --- |
| `init.lua` | 启动入口：引导 lazy.nvim，加载主题与各模块 |
| `lua/options.lua` | 编辑器选项（缩进、剪贴板等沿用 NvChad 默认） |
| `lua/mappings.lua` | 自定义键位 |
| `lua/chadrc.lua` | 主题（ayu_dark）、透明度与 UI |
| `lua/configs/` | 插件配置：`conform.lua`、`lspconfig.lua`、`opencode.lua`、`lazy.lua` |
| `lua/plugins/` | 插件声明；目录下的每个 `.lua` 会被自动 import，无需索引文件 |

## 常用键位

- `<leader>q`：退出 Neovim（有未保存文件时会询问）
- `<C-a>`：向 OpenCode 提问（普通 / 可视模式，自动附带 `@this` 上下文）
- `<C-x>`：打开 OpenCode 选择菜单（内置提示词 / 已注册命令）
- `go` / `goo`：把当前范围 / 当前行发送给 OpenCode
- `<C-.>` / `<leader>oo`：显示或隐藏 OpenCode 终端
- `<leader>lg`：打开 lazygit
- `<leader>nc`：打开本配置目录
- `<leader>rc` / `<leader>rl` / `<leader>rs`：运行当前文件 / 当前行 / 选中 Lua 代码
- `gco` / `gcO`：在下方 / 上方插入注释并进入插入模式

## OpenCode

通过 [opencode.nvim](https://github.com/nickjvandyke/opencode.nvim) 在 Neovim 内直接和 OpenCode 交互：

- OpenCode v2 默认使用后台服务：只要服务已启动，插件会通过 `service.json` 自动发现它；没有可用服务时，会在右侧分屏启动 `opencode`。
- `<C-a>` 输入的提示词支持 `@this`、`@buffer`、`@buffers`、`@diagnostics`、`@marks`、`@quickfix`、`@visible` 等上下文占位符。
- OpenCode 修改文件时缓冲区会自动重载；请求编辑权限时会打开 diff，`da` / `dr` 接受或拒绝，`q` 关闭。
- 状态栏只在连接成功后显示 OpenCode 图标与地址。
- 未安装 snacks.nvim，因此 `ask()` / `select()` 使用 Neovim 原生的 `vim.ui.input` / `vim.ui.select`；安装并启用 snacks 的 input / picker 后会自动获得浮动输入框、预览和 LSP 补全。
- 排查问题：`:checkhealth opencode`。

> 当前插件跟随 `main` 分支以支持 OpenCode v2；OpenCode 需要已安装并在 `PATH` 中。

## 说明

- 格式化：保存时由 conform.nvim 自动执行。Lua 用 stylua，Python 用 ruff，Zsh 用 shfmt，前端与配置文件用 prettierd（缺失时回退 prettier）。
- LSP：使用 Neovim 0.11+ 的 `vim.lsp.config` / `vim.lsp.enable`，服务器通过 Mason 安装。
- 补全：blink.cmp（NvChad 默认的 nvim-cmp 已禁用）。

## 新增插件

在 `lua/plugins/` 下新建文件并返回 lazy.nvim 的 spec 即可。较长的插件配置可以放到 `lua/configs/`，再在 spec 中 `require`。

## Credits

- [NvChad/starter](https://github.com/NvChad/starter)
- [LazyVim](https://github.com/LazyVim/LazyVim)
