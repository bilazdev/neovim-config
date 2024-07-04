---@type ChadrcConfig
local M = {}

M.ui = { theme = 'catppuccin' }
M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

vim.opt.clipboard = "unnamedplus"
vim.opt.wrap = false
vim.opt.foldlevel = 9999
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.relativenumber = true
vim.opt.shiftwidth = 4
vim.opt.cursorline = true

return M
