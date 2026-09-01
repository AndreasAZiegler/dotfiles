return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      clangd = {
        mason = vim.fn.executable("clangd") == 0,
      },
      ccls = {
        mason = vim.fn.executable("clangd") == 0,
        init_options = {
          cache = {
            directory = '/tmp/ccls-cache',
          },
        },
      },
      ruff = {
        cmd_env = { RUFF_TRACE = "messages" },
        init_options = {
          settings = {
            logLevel = "error",
          },
        },
      },
    },
  },
}
