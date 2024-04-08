return {
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
  -- Let's add the rose pine here
}
