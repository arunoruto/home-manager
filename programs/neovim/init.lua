-- set tab size and indentation
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.termguicolors = true

-- Configure clipboard and line number for copying
--vim.opt.clipboard += 'unnamed,unnamedplus'
vim.opt.mouse = 'a'

-- Line numbering
vim.opt.relativenumber = true

-- change leader key to space
vim.g.mapleader = ' '

-- set theme
vim.cmd.colorscheme('catppuccin-macchiato')

require("lualine").setup()
require("bufferline").setup{}
require('Comment').setup()
