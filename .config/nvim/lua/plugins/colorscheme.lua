-- Colorscheme configuration
return {
  -- TokyoNight (LazyVim default, recommended)
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "night",
    },
  },

  -- Jellybeans (your previous colorscheme, uncomment to use)
  -- {
  --   "nanotech/jellybeans.vim",
  --   lazy = false,
  --   priority = 1000,
  -- },
}
