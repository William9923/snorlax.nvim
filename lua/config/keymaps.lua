-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
local Util = require("lazyvim.util")
local dicipline = require("personal.dicipline")
dicipline.norepeat()

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Better keybinding when searching
keymap("n", ".", ";", opts)
keymap("v", ".", ";", opts)

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)

-- Auto close bracket
keymap("i", "'", "''<left>", opts)
keymap("i", '"', '""<left>', opts)
keymap("i", "(", "()<left>", opts)
keymap("i", "{", "{}<left>", opts)
keymap("i", "[", "[]<left>", opts)
keymap("i", "<", "<><left>", opts)
keymap("i", "`", "``<left>", opts)

-- Clear highlights
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

-- Close buffers
keymap("n", "<S-q>", "<cmd>Bdelete!<CR>", opts)

-- Fast saving with Ctrl + s
keymap("n", "<C-s>", ":w<CR>", opts)

-- Select All with Ctrl + a
keymap("n", "<C-a>", "gg<S-v>G", opts)
keymap("v", "<C-a>", "gg<S-v>G", opts)
-- Easier Replace
keymap("n", "r", "R", opts)

-- Increment/decrement digits
keymap("n", "+", "<C-a>", opts)
keymap("n", "-", "<C-x>", opts)

-- Delete without yanking
keymap("n", "d", '"_d', opts)
keymap("n", "x", '"_x', opts)

-- Open current directories + File
keymap("n", "te", ":tabedit<CR>", opts) -- new tab

-- Splitting windows (deprecated => should use tmux navigation...)
keymap("n", "<leader>ss", ":split<Return><C-w>w", opts) -- split windows (horizontal)
keymap("n", "<leader>sv", ":vsplit<Return><C-w>w", opts) -- split windows (vertical)
keymap("n", "<leader>sq", "<C-w>q", opts) -- close split windows

-- Stay in normal/visual mode when entering
keymap("n", "<CR>", "i<CR><esc>", opts)
keymap("v", "<CR>", "i<CR><esc>", opts)

-- Insert --
-- Press kk fast to esc
keymap("i", "kk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<S-j>", ":m .+1<CR>==gv", opts)
keymap("v", "<S-k>", ":m .-2<CR>==gv", opts)
keymap("x", "<S-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<S-k>", ":move '<-2<CR>gv-gv", opts)

-- Autofolding
keymap("n", "<leader>z", ":let&l:fdl=indent('.')/&sw<cr>", opts)
keymap("x", "<leader>z", ":let&l:fdl=indent('.')/&sw<cr>", opts)

-- Formatting
keymap("n", "<leader>ff", function()
  Util.format({ force = true })
end, opts)

keymap("v", "<leader>ff", function()
  Util.format({ force = true })
end, opts)

keymap("n", "<leader>f", vim.diagnostic.open_float, opts)

-- Vim Tmux Navigation
keymap("n", "<C-h>", ":NvimTmuxNavigateLeft<cr>", opts)
keymap("n", "<C-j>", ":NvimTmuxNavigateDown<cr>", opts)
keymap("n", "<C-k>", ":NvimTmuxNavigateUp<cr>", opts)
keymap("n", "<C-l>", ":NvimTmuxNavigateRight<cr>", opts)
