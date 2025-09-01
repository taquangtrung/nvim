-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

------------------------------------------------------------------------------

-- NOTE: This file is loaded before LazyVIM.
-- The options configured here might be overridden by LazyVIM and other plugins.

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = false -- use absolute line number
-- vim.opt.numberwidth = 1
vim.opt.signcolumn = "no" -- no blank whitespace before line numbers

-- Use the directory of the current buffer as the working directory
vim.opt.autochdir = true

-- CUnfold all code by default
vim.opt.foldenable = false

-- Disable auto-formatting
vim.g.autoformat = false

-- Disable smooth scrolling
vim.opt.smoothscroll = false

-- Make `_` as a word separator
vim.opt.iskeyword:remove("_")

-- Statuslinem, tabline
vim.opt.laststatus = 2
vim.opt.showtabline = 0

-- Text display
vim.opt.listchars = {
    tab = "> ",
    trail = " ", -- do not show trailing whitespace
    nbsp = "+",
}
vim.opt.fillchars = {
    stl = "─",
    stlnc = "─",
    horiz = "─",
    horizup = "┴",
    horizdown = "┬",
    vert = "│",
    vertleft = "┤",
    vertright = "├",
    verthoriz = "┼",
}
vim.opt.concealcursor = "n" -- always conceal in normal mode
vim.opt.foldlevel = 0 -- do not fold code by default

-- Text wrapping
vim.opt.wrap = true
vim.opt.breakindent = true
vim.opt.breakindentopt = 'list:-1'
vim.opt.showbreak = ""
vim.opt.linebreak = true

-- Disable automatically start a new comment on new lines
vim.opt.formatoptions:remove({ "r", "o" })

-- Shared data
vim.opt.shada = "!,'1000,<500,s100,h"

-- Diagnostic
vim.diagnostic.config({ float = { border = "single" } })

-- Colors
vim.o.termguicolors = true

-- Editorconfig
vim.g.editorconfig = true

-- LazyVim Options
vim.g.snacks_animate = false
