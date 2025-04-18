return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    opts = {
      suggestion = {
        enabled = false,
        keymap = {
          accept = "<leader>ll",
          accept_word = false,
          accept_line = false,
          next = "<leader>l]",
          prev = "<leader>l[",
        },
      },
      enabled = true,
      panel = { enabled = false },
      filetypes = {
        markdown = false,
        help = false,
      },
    },
  },
}
