return {
  {
    "vimwiki/vimwiki",
    lazy = true,
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
