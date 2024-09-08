return {
  -- messages, cmdline and the popupmenu
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      table.insert(opts.routes, {
        filter = {
          event = "notify",
          find = "No information available",
        },
        opts = { skip = true },
      })
      table.insert(opts.routes, {
        filter = {
          event = "msg_show",
          -- NOTE: add any annoying message here
          any = {
            { find = "%d+L, %d+B" },
            { find = "; after #%d+" },
            { find = "; before #%d+" },
            { find = "%d+ more lines" },
            { find = "%d+ fewer lines" },
            { find = "%d+ lines yanked" },
          },
        },
        view = "mini",
        opts = { skip = true },
      })
      local focused = true
      vim.api.nvim_create_autocmd("FocusGained", {
        callback = function()
          focused = true
        end,
      })
      vim.api.nvim_create_autocmd("FocusLost", {
        callback = function()
          focused = false
        end,
      })
      table.insert(opts.routes, 1, {
        filter = {
          cond = function()
            return not focused
          end,
        },
        view = "notify_send",
        opts = { stop = false },
      })
      opts.commands = {
        all = {
          -- options for the message history that you get with `:Noice`
          view = "split",
          opts = { enter = true, format = "details" },
          filter = {},
        },
      }
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "markdown",
        callback = function(event)
          vim.schedule(function()
            require("noice.text.markdown").keys(event.buf)
          end)
        end,
      })
      opts.presets.lsp_doc_border = false
      opts.presets.bottom_search = true
    end,
  },
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
        theme = "rose-pine",
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
