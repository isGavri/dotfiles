return {
  -- Opens table to add configuration
  {
    "sainnhe/gruvbox-material",
    config = function()
      -- Sets up configuration for colorscheme

      vim.g.gruvbox_material_enable_italic = true
      vim.g.gruvbox_material_foreground = "mix"
      vim.cmd.colorscheme("gruvbox-material")

      -- Adjust window for neo-tree

      require("neo-tree").setup({
        window = {
          position = "right",
          width = "40",
        },
        filesystem = {
          filtered_items = {
            visible = true,
            show_hidden_count = true,
            hide_dotfiles = false,
            hide_gitignored = true,
          },
        },
      })

      -- Set keymapping for nvim-cmp

      local cmp = require("cmp")
      cmp.setup({
        -- Needs work
        mapping = {
          ["<TAB>"] = cmp.mapping.select_next_item(),
          ["<S-TAB>"] = cmp.mapping.select_prev_item(),
        },
      })
    end,
  },
  -- latex config
  {
    "lervag/vimtex",
    lazy = false, -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
    init = function()
      -- VimTeX configuration goes here, e.g.
      vim.g.vimtex_view_method = "zathura"
    end,
  },
  {
    "iurimateus/luasnip-latex-snippets.nvim",
    -- vimtex isn't required if using treesitter
    dependencies = { "L3MON4D3/LuaSnip", "lervag/vimtex" },
    config = function()
      require("luasnip-latex-snippets").setup()
      -- or setup({ use_treesitter = true })
      require("luasnip").config.setup({ enable_autosnippets = true })
    end,
  },
}
