return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "stylua",
        "luacheck",
        "shellcheck",
        "shfmt",
        "css-lsp",
        "goimports",
        "gofumpt",
      })
    end,
  },

  -- lsp servers
  {
    "neovim/nvim-lspconfig",
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      -- disable
      keys[#keys + 1] = { "<leader>ca", false }
      keys[#keys + 1] = { "<leader>cr", false }
      -- add a keymap
      keys[#keys + 1] = { "gh", "<cmd>FzfLua lsp_references<cr>", desc = "References" }
      keys[#keys + 1] =
        { "<leader>la", vim.lsp.buf.code_action, desc = "Code Action", mode = { "n", "v" }, has = "codeAction" }
      if require("lazyvim.util").has("inc-rename.nvim") then
        keys[#keys + 1] = {
          "<leader>lr",
          function()
            local inc_rename = require("inc_rename")
            return ":" .. inc_rename.config.cmd_name .. " " .. vim.fn.expand("<cword>")
          end,
          expr = true,
          desc = "Rename",
          has = "rename",
        }
      else
        keys[#keys + 1] = { "<leader>lr", vim.lsp.buf.rename, desc = "Rename", has = "rename" }
      end
    end,
    opts = {
      inlay_hints = { enabled = true },
      servers = {
        ruby_lsp = {
          mason = false,
          cmd = { vim.fn.expand("~/.rbenv/shims/ruby-lsp") },
        },
        rubocop = {
          mason = false,
          cmd = { vim.fn.expand("~/.rbenv/shims/rubocop"), "--lsp" },
        },
        pyright = {},
        cssls = {},
        html = {},
        yamlls = {
          settings = {
            yaml = {
              keyOrdering = false,
            },
          },
        },
        lua_ls = {},
        vtsls = {},
      },
      gopls = {},
    },
    setup = {
      gopls = function(_, opts)
        -- workaround for gopls not supporting semanticTokensProvider
        -- https://github.com/golang/go/issues/54531#issuecomment-1464982242
        require("lazyvim.util").lsp.on_attach(function(client, _)
          if client.name == "gopls" then
            if not client.server_capabilities.semanticTokensProvider then
              local semantic = client.config.capabilities.textDocument.semanticTokens
              client.server_capabilities.semanticTokensProvider = {
                full = true,
                legend = {
                  tokenTypes = semantic.tokenTypes,
                  tokenModifiers = semantic.tokenModifiers,
                },
                range = true,
              }
            end
          end
        end)
        -- end workaround
      end,
    },
  },
}
