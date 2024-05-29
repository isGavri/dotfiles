return {
  {
    "Aasim-A/scrollEOF.nvim",
    event = { "CursorMoved", "WinScrolled" },
    opts = {},
    config = function()
      require("scrollEOF").setup()
      vim.cmd("setglobal scrolloff=4")
    end,
  },
}
