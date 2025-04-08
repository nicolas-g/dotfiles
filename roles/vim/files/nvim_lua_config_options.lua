-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- show file path on upper rigth
vim.opt.winbar = "%=%m %f"

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.cursorcolumn = true

-- views can only be fully collapsed with the global statusline
vim.opt.laststatus = 3
