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
  --   variant = "main",
  --   dark_variant = "main",
  --   lazy = true,
  --   priority = 1000,
  --   opts = {
  --     styles = {
  --       bold = true,
  --       italic = true,
  --       transparency = false,
  --     },
  --   },
  -- },
  {
    "slugbyte/lackluster.nvim",
    lazy = false,
    priority = 1000,
    init = function()
      -- vim.cmd.colorscheme("lackluster")
      vim.cmd.colorscheme("lackluster-hack") -- my favorite
      -- vim.cmd.colorscheme("lackluster-mint")
    end,
  },
  { "ellisonleao/gruvbox.nvim", priority = 1000, config = true },
}
