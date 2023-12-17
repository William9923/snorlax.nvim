return {
  -- disable
  { "folke/trouble.nvim", enabled = false },
  { "echasnovski/mini.ai", enabled = false },
  { "folke/which-key.nvim", enabled = false },
  { "ggandor/leap.nvim", enabled = false },
  { "folke/flash.nvim", enabled = false },
  { "folke/noice.nvim", enabled = false },
  { "mfussenegger/nvim-lint", enabled = false },
  {
    "rafamadriz/friendly-snippets",
    enabled = false,
  },
  { "echasnovski/mini.pairs", enabled = false },
  { "echasnovski/mini.surround", enabled = false },
  { "folke/tokyonight.nvim", enabled = false },
  { "catppuccin/nvim", enabled = false },
  { "nvim-telescope/telescope-fzf-native.nvim", enabled = false },
  { "echasnovski/mini.bufremove", enabled = false },
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
