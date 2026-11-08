vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local opt = vim.opt;

opt.signcolumn = 'yes'
opt.relativenumber = true
opt.number = true

opt.wrap = false

opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true

opt.undofile = true
opt.clipboard = 'unnamedplus'

opt.scrolloff = 10
opt.sidescrolloff = 8

opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false

opt.inccommand = 'nosplit'
opt.updatetime = 250
