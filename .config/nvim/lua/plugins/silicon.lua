return {
  {
    "michaelrommel/nvim-silicon",
    lazy = true,
    cmd = "Silicon",
    config = function()
      require("silicon").setup({
        font = "Iosevka Nerd Font=16",
        theme = "OneHalfDark",
        background = "#161b22",
        shadow_blur_radius = 0,
        shadow_offset_x = 0,
        shadow_offset_y = 0,
        shadow_color = nil,
        output = function()
          local name
          vim.ui.input({ prompt = "Enter file name: " }, function(input)
            name = input
          end)
          return "./images/" .. name .. os.date("_%m-%d") .. ".png"
        end,
      })
    end,
  },
  {
    --"mistricky/codesnap.nvim",
    --build = "make build_generator",
  },
}
