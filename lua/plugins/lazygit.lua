-- 在 Neovim 内调用 lazygit
return {
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- 浮动窗口边框装饰所需的可选依赖
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    -- 通过按键懒加载，首次按下时才会真正加载插件
    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
    },
  },
}
