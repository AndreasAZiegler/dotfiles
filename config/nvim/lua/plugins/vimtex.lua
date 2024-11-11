return {
  -- add vimtex
  {
    "lervag/vimtex",
    ft = "tex", -- without ft, it's not working too
    config = function()
      vim.cmd("call vimtex#init()")
    end,
  },
}
