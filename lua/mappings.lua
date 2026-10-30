require "nvchad.mappings"

local map = vim.keymap.set

map("n", ";", ":", { desc = "Enter command mode" })
map("i", "jk", "<Esc>", { desc = "Exit insert mode" })
map("n", "<leader>q", "<cmd>confirm qa<cr>", { desc = "Quit Neovim" })

-- 剪贴板：NvChad 已设置 clipboard=unnamedplus，y/d/p 默认就会使用系统剪贴板。
-- 这里只把 x/X/s/c 这类“改字符”送进黑洞寄存器，避免覆盖剪贴板。
-- C/S 是独立命令，不会经过 c 的映射，因此需要单独处理。
map({ "n", "x" }, "x", '"_x', { desc = "Delete char without yanking" })
map({ "n", "x" }, "s", '"_s', { desc = "Substitute without yanking" })
map({ "n", "x" }, "c", '"_c', { desc = "Change without yanking" })
map("n", "X", '"_X', { desc = "Delete char before without yanking" })
map("n", "C", '"_C', { desc = "Change to end without yanking" })
map("n", "S", '"_S', { desc = "Change line without yanking" })

-- 可视模式用 P 覆盖选区：v_P 不会把被替换的内容写进无名寄存器（也就是剪贴板）
map("x", "p", '"+P', { desc = "Paste over selection without yanking" })

-- j/k 按显示行移动；带 count 时按实际行移动
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true, desc = "Move down" })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true, desc = "Move up" })

-- 运行当前文件 / 当前行 / 选中代码（Lua）
map("n", "<leader>rc", "<cmd>source %<cr>", { desc = "Source current file" })
map("n", "<leader>rl", "<cmd>.lua<cr>", { desc = "Run current line as Lua" })
map("x", "<leader>rs", ":lua<cr>", { desc = "Run selection as Lua" })

-- 在下方 / 上方新建一行注释并进入插入模式
local function comment_line(above)
  local before, after = vim.bo.commentstring:match "^(.-)%%s(.*)$"
  if not before then
    return
  end

  local row = vim.api.nvim_win_get_cursor(0)[1]
  local indent = vim.fn.getline(row):match "^%s*" or ""
  local insert_at = above and row - 1 or row

  vim.api.nvim_buf_set_lines(0, insert_at, insert_at, false, { indent .. before .. after })
  vim.api.nvim_win_set_cursor(0, { insert_at + 1, #indent + #before })
  vim.cmd "startinsert"
end

map("n", "gco", function()
  comment_line(false)
end, { desc = "Add comment below" })

map("n", "gcO", function()
  comment_line(true)
end, { desc = "Add comment above" })

-- 打开 Neovim 配置目录
map("n", "<leader>nc", function()
  local ok, api = pcall(require, "nvim-tree.api")
  if not ok then
    vim.notify("nvim-tree is not available", vim.log.levels.WARN)
    return
  end
  api.tree.open { path = vim.fn.stdpath "config", find_file = true }
end, { desc = "Open Neovim config directory" })
