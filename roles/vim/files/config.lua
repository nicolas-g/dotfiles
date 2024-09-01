-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
--
reload("user.options")
reload("user.plugins")
reload("user.keymaps")

-- Make sure Python language parser is always installed
-- for syntax highligting and indentation
lvim.builtin.treesitter.ensure_installed = {
  "python",
}

-- `:MasonInstall black`
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup { { name = "black" }, }

-- flake8 is a commonly used linter for Python
-- `:MasonInstall flake8`
-- NOTE: To format your python file you can press `space l f`
local linters = require "lvim.lsp.null-ls.linters"
linters.setup { { command = "flake8", args = { "--ignore=E203" }, filetypes = { "python" } } }

-- `:MasonInstall debugpy`
-- setup debug adapter
lvim.builtin.dap.active = true
local mason_path = vim.fn.glob(vim.fn.stdpath "data" .. "/mason/")
pcall(function()
  require("dap-python").setup(mason_path .. "packages/debugpy/venv/bin/python")
end)

# Enable Spelling
vim.opt.spell = true
vim.opt.spelllang = { "en" }
