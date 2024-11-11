return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      clangd = {
        mason = vim.fn.executable("clangd") == 0,
      },
      ccls = {
        mason = vim.fn.executable("clangd") == 0,
      },
    },
  },
}
