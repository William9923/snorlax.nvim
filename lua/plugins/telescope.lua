local actions = require("telescope.actions")
return {
  "nvim-telescope/telescope.nvim",
  keys = {
    {
      ";f",
      function()
        require("telescope.builtin").find_files()
      end,
      desc = "Find Files",
    },
    {
      ";r",
      function()
        require("telescope.builtin").live_grep()
      end,
      desc = "Live Grep Search",
    },
    {
      ";b",
      function()
        require("telescope.builtin").buffers()
      end,
      desc = "List Buffer",
    },
    {
      ";d",
      function()
        require("telescope.builtin").diagnostics()
      end,
      desc = "List Diagnostics",
    },
    {
      ";k",
      function()
        require("telescope.builtin").keymaps()
      end,
      desc = "List Diagnostics",
    },
  },
  opts = {
    defaults = {
      theme = "ivy",
      prompt_prefix = "  ",
      selection_caret = " ",
      path_display = { "smart" },
      file_ignore_patterns = { ".git/", "node_modules", "vendor" },
      layout_strategy = "horizontal",
      layout_config = { prompt_position = "bottom" },
      sorting_strategy = "descending",
      winblend = 0,

      mappings = {
        i = {
          ["<Down>"] = actions.cycle_history_prev,
          ["<Up>"] = actions.cycle_history_next,
          ["<C-k>"] = actions.move_selection_previous,
          ["<C-j>"] = actions.move_selection_next,
        },
      },
    },
  },
}
