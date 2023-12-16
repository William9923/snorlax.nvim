return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    cmd = "Neotree",
    lazy = true,
    opts = {
      window = {
        width = 25,
        mapping_options = {
          noremap = false,
          nowait = true, -- NOTE: not wait for any default keymap associated with 'o'
          silent = true,
        },
        mappings = {
          ["<space>"] = "none",
          ["o"] = "open", -- NOTE: to make the behavior same with neotree
        },
      },
    },
  },
  {
    "RRethy/vim-illuminate",
    event = "LazyFile",
    opts = {
      delay = 200,
      large_file_cutoff = 1000,
      large_file_overrides = {
        providers = { "lsp" },
      },
      under_cursor = true,
      providers = {
        "lsp",
        "treesitter",
        "regex",
      },
      filetypes_denylist = {
        "dirvish",
        "fugitive",
        "alpha",
        "NvimTree",
        "packer",
        "neogitstatus",
        "Trouble",
        "lir",
        "Outline",
        "spectre_panel",
        "toggleterm",
        "DressingSelect",
        "TelescopePrompt",
      },
    },
  },
}
