return {
  -- Gruvbox theme
  -- {
  --   "ellisonleao/gruvbox.nvim",
  --   lazy = true,
  --   priority = 1000,
  --   opts = function()
  --     return {
  --       transparent_mode = false,
  --     }
  --   end,
  -- },
  -- Rose pine theme (Moon edition)
  -- {
  --   "rose-pine/neovim",
  --   name = "rose-pine",
  --   variant = "moon",
  --   dark_variant = "moon",
  --   lazy = true,
  --   priority = 1000,
  --   opts = {
  --     styles = {
  --       bold = true,
  --       italic = true,
  --       transparency = true,
  --     },
  --   },
  -- },
  {
    "AlexvZyl/nordic.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("nordic").setup({
        transparent_bg = true,
        telescope = {
          style = "classic",
        },
      })
    end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = {
      style = "night",
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
      on_highlights = function(hl, c)
        -- Visual Highlight more clear...
        hl.Visual = {
          bg = c.cyan,
          fg = c.bg_dark,
        }
      end,
    },
  },
}
