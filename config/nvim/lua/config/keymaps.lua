-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Map "<leader>ol" to switch between header and implementation:
vim.keymap.set({ "n", "v" }, "<leader>ol", "<Cmd>ClangdSwitchSourceHeader<CR>")
