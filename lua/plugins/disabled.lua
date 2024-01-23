return {
  -- disable
  { "echasnovski/mini.ai", enabled = false },
  { "folke/which-key.nvim", enabled = false },
  { "ggandor/leap.nvim", enabled = false },
  { "folke/flash.nvim", enabled = false },
  { "mfussenegger/nvim-lint", enabled = false },
  { "nvim-pack/nvim-spectre", enabled = false },
  { "folke/trouble.nvim", enabled = false },
  { "stevearc/aerial.nvim", enabled = false },
  {
    "rafamadriz/friendly-snippets",
    enabled = false,
  },
  { "echasnovski/mini.pairs", enabled = false },
  { "echasnovski/mini.surround", enabled = false },
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
