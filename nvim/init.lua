vim.g.mapleader = " "

require("mappings")

vim.opt.number = true

vim.opt.linebreak = true
vim.opt.wrap = false

vim.opt.scrolloff = 5
vim.opt.sidescrolloff = 5

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.undofile = true

require("plugins")

vim.cmd.colorscheme("catppuccin")
