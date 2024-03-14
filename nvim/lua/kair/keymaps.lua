-- Shorthand variable
local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- Remap F9 as keyleader
vim.cmd([[
  let mapleader = "\<F9>"
]])

-- Normal Mode
keymap("n", "<S-Left>", "<C-w><Left>", opts)      -- Shift+Left to change to left window
keymap("n", "<S-Right>", "<C-w><Right>", opts)    -- Shift+Right to change to right window
keymap("n", "<S-Up>", "<C-w><Up>", opts)          -- Shift+Up to change to top window
keymap("n", "<S-Down>", "<C-w><Down>", opts)      -- Shift+Down to change to down window
keymap("n", "<C-PageUp>", ":bprevious<CR>", opts) -- Change to next buffer
keymap("n", "<C-PageDown>", ":bnext<CR>", opts)   -- Change to previous buffer
keymap("n", "<C-W>", ":bd<CR>", opts)             -- Unload current buffer

-- Input Mode
keymap("i", "<C-BS>", "<C-w>", opts) -- Ctrl+Backspace to delete word

-- Visual Mode
keymap("v", "<Tab>", ">><Esc>gv", opts)   -- Indent selection then select again
keymap("v", "<S-Tab>", "<<<Esc>gv", opts) -- Reverse indent selection then select again

-- Terminal Mode
keymap("t", "<ESC>", "<C-\\><C-n>", opts)
