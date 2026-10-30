-- Treesitter 语法解析器，确保安装以下语言的 parser
return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "python",
        "javascript",
        "typescript",
        "json",
        "ron",
        "zsh",
        "bash",
      },
    },
  },
}
