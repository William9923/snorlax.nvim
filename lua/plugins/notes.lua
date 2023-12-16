return {
  {
    "vimwiki/vimwiki",
    lazy = false,
    keys = { "<leader>ww", "<leader>wt" },
    init = function()
      vim.g.vimwiki_folding = ""
      vim.g.vimwiki_list = {
        {
          path = "~/vimwiki",
          syntax = "default",
          ext = ".wiki",
        },
      }
    end,
  },
}
