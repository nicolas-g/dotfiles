lvim.plugins = {

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "black", -- pep8 formating
        "debugpy",
        "pyright",
      },
    },
  },

  { "mfussenegger/nvim-dap" },
  { "mfussenegger/nvim-dap-python" },
}
