return {
  {
    "saghen/blink.cmp",
    dependencies = {
      "fang2hou/blink-copilot",
      opts = {
        max_completions = 1, -- Global default for max completions
        max_attempts = 2, -- Global default for max attempts
      },
    },
    opts = {
      sources = {
        default = { "copilot" },
        providers = {
          copilot = {
            name = "copilot",
            module = "blink-copilot",
            score_offset = 100,
            async = true,
            opts = {
              -- Local options override global ones
              max_completions = 3, -- Override global max_completions
              -- Final settings:
              -- * max_completions = 3
              -- * max_attempts = 2
              -- * all other options are default
            },
          },
        },
      },

      enabled = function()
        local context_status_ok, context = pcall(require, "cmp.config.context")
        if not context_status_ok then
          return true -- NOTE: by default, we should always apply auto-completion
        end

        -- Disable autocomplete on prompt
        if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
          return false
        end

        -- Disable custom plugin autocompletion
        for _, filetype in pairs({ "vimwiki", "NeoTree", "NvimTree" }) do
          if vim.bo.filetype == filetype then
            return false
          end
        end

        -- Disable autocomplete on comments
        if vim.api.nvim_get_mode().mode == "c" then
          return true
        else
          return not context.in_treesitter_capture("comment")
            and not context.in_syntax_group("Comment")
            and not vim.tbl_contains({ "markdown" }, vim.bo.filetype)
        end
      end,
    },
  },
}
