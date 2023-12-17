return {
  -- buffer filename
  {
    "b0o/incline.nvim",
    event = "BufReadPre",
    priority = 1200,
    config = function()
      require("incline").setup({
        highlight = {
          groups = {
            InclineNormal = { guibg = "cyan", guifg = "black" },
            InclineNormalNC = { guifg = "magenta", guibg = "black" },
          },
        },
        window = { margin = { vertical = 0, horizontal = 1 } },
        hide = {
          cursorline = true,
        },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
          if vim.bo[props.buf].modified then
            filename = "[+] " .. filename
          end

          local icon, color = require("nvim-web-devicons").get_icon_color(filename)
          return { { icon, guifg = color }, { " " }, { filename } }
        end,
      })
    end,
  },

  -- buffer line
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    keys = {
      { "<leader>.", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
      { "<leader>,", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
    },
    opts = {
      options = {
        mode = "tabs",
        -- separator_style = "slant",
        show_buffer_close_icons = false,
        show_close_icon = false,
      },
    },
  },

  -- statusline (use default status line)
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {
      options = {
        theme = "gruvbox",
      },
    },
  },

  -- dashboard
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = function(_, opts)
      local logo = [[
      ██╗     ██╗███╗   ██╗██╗   ██╗██╗  ██╗██╗  ██╗███████╗██╗     ██╗
      ██║     ██║████╗  ██║██║   ██║╚██╗██╔╝██║  ██║██╔════╝██║     ██║
      ██║     ██║██╔██╗ ██║██║   ██║ ╚███╔╝ ███████║█████╗  ██║     ██║
      ██║     ██║██║╚██╗██║██║   ██║ ██╔██╗ ██╔══██║██╔══╝  ██║     ██║
          ███████╗██║██║ ╚████║╚██████╔╝██╔╝ ██╗██║  ██║███████╗███████╗███████╗
          ╚══════╝╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝
        by: William Ong
      ]]

      logo = string.rep("\n", 8) .. logo .. "\n\n"
      opts.config.header = vim.split(logo, "\n")
      local footer = function()
        local stats = require("lazy").stats()
        return {
          "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins",
        }
      end
      opts.config.footer = footer()
      opts.config.center = {
        { action = "Telescope find_files", desc = " Find file", icon = " ", key = "f" },
        { action = 'lua require("persistence").load()', desc = " Restore Session", icon = " ", key = "s" },
        { action = "Lazy", desc = " Lazy", icon = "󰒲 ", key = "l" },
        { action = "qa", desc = " Quit", icon = " ", key = "q" },
      }
    end,
  },

  -- AutoFold UI
  {
    "anuvyklack/pretty-fold.nvim",
    event = "VeryLazy",
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
    config = function()
      local fold = require("pretty-fold")
      fold.setup({
        keep_indentation = false,
        fill_char = "━",
        sections = {
          left = {
            "━ ",
            function()
              return string.rep("*", vim.v.foldlevel)
            end,
            " ━┫",
            "content",
            "┣",
          },
          right = {
            "┫ ",
            "number_of_folded_lines",
            ": ",
            "percentage",
            " ┣━━",
          },
        },
      })
    end,
  },

  -- cursor animation
  {
    "echasnovski/mini.animate",
    event = "VeryLazy",
    opts = function(_, opts)
      local animate = require("mini.animate")
      opts.scroll = {
        enable = false,
      }
      opts.resize = {
        enable = false,
      }
      opts.open = {
        enable = false,
      }
      opts.close = {
        enable = false,
      }
      opts.cursor = {
        timing = animate.gen_timing.linear({ duration = 125, unit = "total" }), -- adjust the duration of how the cursor travel (in ms)
      }
    end,
  },

  -- tmux navigation
  {
    "alexghergh/nvim-tmux-navigation",
    event = "VeryLazy",
    config = function()
      require("nvim-tmux-navigation").setup({
        disable_when_zoomed = true, -- defaults to false
        keybindings = {
          left = "<C-h>",
          down = "<C-j>",
          up = "<C-k>",
          right = "<C-l>",
          last_active = "<C-\\>",
          next = "<C-Space>",
        },
      })
    end,
  },
}
