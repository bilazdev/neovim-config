---@type ChadrcConfig
local M = {}

M.ui = { theme = 'catppuccin' }
M.plugins = "custom.plugins"

vim.opt.clipboard = "unnamedplus"
vim.opt.wrap = false
vim.opt.foldlevel = 9999
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.relativenumber = true

return M
