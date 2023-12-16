-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Better keybinding when searching
keymap("n", ".", ";", opts)
keymap("v", ".", ";", opts)

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
-- keymap("", ";", "<Nop>", opts)

vim.g.mapleader = " "

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

-- Clear highlights
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

-- Close buffers
keymap("n", "<S-q>", "<cmd>Bdelete!<CR>", opts)

-- Better paste
-- keymap("v", "p", '"_dP', opts)

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

keymap("n", "<leader>ff", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", opts)
