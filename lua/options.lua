require "nvchad.options"

vim.opt.clipboard = "unnamedplus"
vim.opt.wrap = false
vim.opt.foldlevel = 9999
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.relativenumber = true
vim.opt.shiftwidth = 4
vim.opt.cursorline = true

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
