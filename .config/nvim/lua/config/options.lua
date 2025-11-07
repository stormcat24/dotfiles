-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua

local opt = vim.opt

-- Cursor movement
opt.whichwrap:append("<,>,[,],h,l")

-- Display
opt.showmode = true
opt.ruler = true
opt.cmdheight = 2

-- Buffer behavior
opt.hidden = true
opt.autoread = true

-- Input timeout (for Japanese input)
opt.ttimeout = true
opt.ttimeoutlen = 50

-- Visual feedback
opt.visualbell = true

-- Mouse
opt.mouse = "a"

-- Clipboard (system clipboard integration)
opt.clipboard = "unnamedplus"

-- Search
opt.incsearch = true

-- Shell
opt.shell = "zsh"

-- No swap file
opt.swapfile = false

-- Backspace behavior
opt.backspace = "indent,eol,start"
