return {
  -- disable
  { "folke/trouble.nvim", enabled = false },
  { "echasnovski/mini.ai", enabled = false },
  { "folke/which-key.nvim", enabled = false },
  { "ggandor/leap.nvim", enabled = false },
  { "nvim-neo-tree/neo-tree.nvim", enabled = false },
  {
    "LazyVim/LazyVim",
    opts = {
      defaults = {
        autocmds = true,
        keymaps = true,
      },
    },
  },
}
