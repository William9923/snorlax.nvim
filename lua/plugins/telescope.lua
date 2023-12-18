local actions = require("telescope.actions")
return {
  {
    "nvim-telescope/telescope.nvim",
    lazy = false,
    priority = 1000,
    keys = function()
      return {
        {
          ";f",
          ":Telescope find_files<CR>",
          desc = "Find Files",
        },
        {
          ";r",
          ":Telescope live_grep<CR>",
          desc = "Live Grep Search",
        },
        {
          ";b",
          ":Telescope buffers<CR>",
          desc = "List Buffer",
        },
        {
          ";d",
          ":Telescope diagnostics<CR>",
          desc = "List Diagnostics",
        },
        {
          ";k",
          ":Telescope keymaps<CR>",
          desc = "List Keymaps",
        },
      }
    end,
    opts = {
      defaults = {
        preview = {
          treesitter = false,
        },
        theme = "ivy",
        prompt_prefix = "  ",
        selection_caret = " ",
        path_display = { "smart" },
        file_ignore_patterns = {
          -- General purposes
          ".git/",
          "node_modules",
          "vendor",

          -- Big files in work related...
          "statik.go",
        },
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
  },
  {
    "nvim-telescope/telescope-frecency.nvim",
    lazy = true,
    config = function()
      require("telescope").load_extension("frecency")
    end,
  },
  {
    "ANGkeith/telescope-terraform-doc.nvim",
    lazy = true,
    config = function()
      require("telescope").load_extension("terraform_doc")
    end,
  },
}
