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
  {
    "rose-pine/neovim",
    name = "rose-pine",
    variant = "moon",
    dark_variant = "moon",
    lazy = true,
    priority = 1000,
    opts = {
      styles = {
        bold = true,
        italic = true,
        transparency = true,
      },
    },
  },
}
