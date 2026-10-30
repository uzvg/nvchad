require "nvchad.options"

-- NvChad 默认 cursorlineopt=number，这里让整行和行号一起高亮
vim.opt.cursorlineopt = "both"

-- 缩进沿用 NvChad 默认：expandtab / shiftwidth=2 / tabstop=2 / softtabstop=2

-- Treesitter 折叠：默认全部展开，需要时用 za / zc 折叠
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevel = 99
