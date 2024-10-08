return {
  -- ** Colorscheme ** --
  -- base-16
  {
    "RRethy/base16-nvim",
    config = function()
      vim.cmd("colorscheme base16-grayscale-dark")
      -- Adjust window for neo-tree

      require("neo-tree").setup({
        window = {
          position = "right",
          width = "30",
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
        mapping = {
          ["<C-j>"] = cmp.mapping.select_next_item(),
          ["<C-k>"] = cmp.mapping.select_prev_item(),
          ["<C-CR>"] = cmp.mapping.confirm({ select = true }),
        },
      })
    end,
  },
  -- ** latex config ** --
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

      -- Keymaps for jumping nodes
      vim.cmd([[
imap <silent><expr> <C-f> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<C-f>'
      ]])

      -- add custom snippets
      local ls = require("luasnip")
      local s = ls.snippet
      local i = ls.insert_node
      local fmta = require("luasnip.extras.fmt").fmta
      local utils = require("luasnip-latex-snippets.util.utils")
      local not_math = utils.with_opts(utils.not_math, false)

      ls.add_snippets("tex", {
        s(
          { trig = "ej;", snippetType = "autosnippet", priority = 100, regTrig = true, wordTrig = false },
          fmta(
            [[
          \indent \textbf{\textit{<>}}<>
          <>]],
            { i(1), i(2), i(3) }
          )
        ),
        s(
          { trig = "el;", snippetType = "autosnippet", priority = 100 },
          fmta(
            [[
          \indent \indent \textit{<>}<>
          <>
      ]],
            { i(1), i(2), i(3) }
          )
        ),
        s(
          { trig = "partial;", snippetType = "autosnippet", priority = 100, regTrig = true, wordTrig = false },
          fmta("\\partial <>", { i(1) })
        ),
        s(
          { trig = "mbb;", snippetType = "autosnippet", priority = 100, regTrig = true, wordTrig = false },
          fmta("\\mathbb{<>} <>", { i(1), i(2) })
        ),
        s(
          { trig = "al;", snippetType = "autosnippet", priority = 100 },
          fmta(
            [[
            \begin{align*}
              <>
            \end{align*}
            ]],
            { i(1) }
          )
        ),
        -- Matrices
        s(
          { trig = "bmat2", snippetType = "autosnippet", priority = 100, regTrig = true, wordTrig = false },
          fmta(
            [[
            $\begin{bmatrix}
            <> & <> \\
            <> & <>
            \end{bmatrix}$
            ]],
            {
              i(1),
              i(2),
              i(3),
              i(4),
            }
          )
        ),
        s(
          { trig = "vmat2", snippetType = "autosnippet", priority = 100, regTrig = true, wordTrig = false },
          fmta(
            [[
            $\begin{vmatrix}
            <> & <> \\
            <> & <>
            \end{vmatrix}$
            ]],
            {
              i(1),
              i(2),
              i(3),
              i(4),
            }
          )
        ),
        s(
          { trig = "bmat3", snippetType = "autosnippet", priority = 100, regTrig = true, wordTrig = false },
          fmta(
            [[
            $\begin{bmatrix}[3]
            <> & <> & <> \\
            <> & <> & <> \\
            <> & <> & <>
            \end{bmatrix}$
            ]],
            {
              i(1),
              i(2),
              i(3),
              i(4),
              i(5),
              i(6),
              i(7),
              i(8),
              i(9),
            }
          )
        ),
        s(
          { trig = "vmat3", snippetType = "autosnippet", priority = 100, regTrig = true, wordTrig = false },
          fmta(
            [[
            $\begin{vmatrix}[3]
            <> & <> & <> \\
            <> & <> & <> \\
            <> & <> & <>
            \end{vmatrix}$
            ]],
            {
              i(1),
              i(2),
              i(3),
              i(4),
              i(5),
              i(6),
              i(7),
              i(8),
              i(9),
            }
          )
        ),

        s({ trig = "lr(", snippetType = "autosnippet", priority = 100 }, fmta("\\left( <> \\right", { i(1) })),
        s({ trig = "lr[", snippetType = "autosnippet", priority = 100 }, fmta("\\left[ <> \\right", { i(1) })),
      })
    end,
    ft = "tex",
  },
  -- eliminate indent line
  { "echasnovski/mini.indentscop", enabled = false },
  { "lukas-reineke/indent-blankline.nvim", enabled = false },
  -- Change Dashboard image
  {
    "nvimdev/dashboard-nvim",
    lazy = false,
    opts = function()
      local logo = [[
          ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣿⣶⣿⣦⣼⣆
           ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦
                 ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷    ⠻⠿⢿⣿⣧⣄
                  ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄
                 ⢠⣿⣿⣿⠈    ⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀
          ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘  ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄
         ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄
        ⣠⣿⠿⠛ ⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄
         ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇ ⠛⠻⢷⣄
         ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆
          ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃
      ]]
      --
      --
      -- local logo = [[
      -- ██╗      █████╗ ███████╗██╗   ██╗██╗   ██╗██╗███╗   ███╗          Z
      -- ██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝██║   ██║██║████╗ ████║      Z
      -- ██║     ███████║  ███╔╝  ╚████╔╝ ██║   ██║██║██╔████╔██║   z
      -- ██║     ██╔══██║ ███╔╝    ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║ z
      -- ███████╗██║  ██║███████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║
      -- ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝
      -- ]]

      logo = string.rep("\n", 3) .. logo .. "\n\n"

      local opts = {
        theme = "doom",
        hide = {
          -- this is taken care of by lualine
          -- enabling this messes up the actual laststatus setting after loading a file
          statusline = false,
        },
        config = {
          header = vim.split(logo, "\n"),
        -- stylua: ignore
        center = {
          { action = 'lua LazyVim.pick()()',                           desc = " Find File",       icon = " ", key = "f" },
          { action = "ene | startinsert",                              desc = " New File",        icon = " ", key = "n" },
          { action = 'lua LazyVim.pick("oldfiles")()',                 desc = " Recent Files",    icon = " ", key = "r" },
          { action = 'lua LazyVim.pick("live_grep")()',                desc = " Find Text",       icon = " ", key = "g" },
          { action = 'lua LazyVim.pick.config_files()()',              desc = " Config",          icon = " ", key = "c" },
          { action = 'lua require("persistence").load()',              desc = " Restore Session", icon = " ", key = "s" },
          { action = "LazyExtras",                                     desc = " Lazy Extras",     icon = " ", key = "x" },
          { action = "Lazy",                                           desc = " Lazy",            icon = "󰒲 ", key = "l" },
          { action = function() vim.api.nvim_input("<cmd>qa<cr>") end, desc = " Quit",            icon = " ", key = "q" },
        },
          footer = function()
            local stats = require("lazy").stats()
            local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
            return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
          end,
        },
      }

      for _, button in ipairs(opts.config.center) do
        button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
        button.key_format = "  %s"
      end

      -- open dashboard after closing lazy
      if vim.o.filetype == "lazy" then
        vim.api.nvim_create_autocmd("WinClosed", {
          pattern = tostring(vim.api.nvim_get_current_win()),
          once = true,
          callback = function()
            vim.schedule(function()
              vim.api.nvim_exec_autocmds("UIEnter", { group = "dashboard" })
            end)
          end,
        })
      end

      return opts
    end,
  },
  -- Vim be good
  {
    "ThePrimeagen/vim-be-good",
  },
  {
    "OXY2DEV/markview.nvim",
    lazy = false, -- Recommended
    -- ft = "markdown" -- If you decide to lazy-load anyway

    dependencies = {
      -- You will not need this if you installed the
      -- parsers manually
      -- Or if the parsers are in your $RUNTIMEPATH
      "nvim-treesitter/nvim-treesitter",

      "nvim-tree/nvim-web-devicons",
    },
  },
}
