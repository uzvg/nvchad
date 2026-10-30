-- ibus-table-remote.nvim：在 Normal/Visual 模式下自动切到英文直通，回到 Insert 时恢复码表输入
-- 仓库：https://github.com/uzvg/ibus-table-remote.nvim
return {
  {
    "uzvg/ibus-table-remote.nvim",
    -- 需要在 ModeChanged 上立即生效，不能懒加载
    lazy = false,
    opts = {
      schema = "zhengma",
    },
  },
}
