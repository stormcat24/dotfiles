-- Yank history (replacement for yankround.vim)
return {
  {
    "gbprod/yanky.nvim",
    dependencies = { "kkharji/sqlite.lua" },
    opts = {
      ring = {
        history_length = 50,
        storage = "sqlite",
      },
      highlight = {
        on_put = true,
        on_yank = true,
        timer = 200,
      },
    },
    keys = {
      { "p", "<Plug>(YankyPutAfter)", mode = { "n", "x" }, desc = "Put after" },
      { "P", "<Plug>(YankyPutBefore)", mode = { "n", "x" }, desc = "Put before" },
      { "<C-p>", "<Plug>(YankyPreviousEntry)", desc = "Previous yank" },
      { "<C-n>", "<Plug>(YankyNextEntry)", desc = "Next yank" },
    },
  },
}
