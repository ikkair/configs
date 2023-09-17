-- Shorthand variable
local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- Remap F9 as keyleader
vim.cmd([[
  let mapleader = "\<F9>"
]])

-- Normal Mode
-- keymap("n", "<Tab>", ">>", opts) -- Tab to indent line
-- keymap("n", "<S-Tab>", "<<", opts) -- Shift tab to reverse indent line
keymap("n", "<C-s>", ":w<CR>", opts)              -- Control+S to save
keymap("n", "<S-Left>", "<C-w><Left>", opts)      -- Shift+Left to change to left window
keymap("n", "<S-Right>", "<C-w><Right>", opts)    -- Shift+Right to change to right window
keymap("n", "<S-Up>", "<C-w><Up>", opts)          -- Shift+Up to change to top window
keymap("n", "<S-Down>", "<C-w><Down>", opts)      -- Shift+Down to change to down window
keymap("n", "<C-PageUp>", ":bprevious<CR>", opts) -- Change to next buffer
keymap("n", "<C-PageDown>", ":bnext<CR>", opts)   -- Change to previous buffer
keymap("n", "<C-W>", ":bd<CR>", opts)             -- Unload current buffer

-- Visual Mode
keymap("v", "<Tab>", ">><Esc>gv", opts)   -- Indent selection then select again
keymap("v", "<S-Tab>", "<<<Esc>gv", opts) -- Reverse indent selection then select again
keymap("v", "<C-s>", "<Esc>:w<CR>", opts) -- Control+S to save
keymap("v", "<C-c>", "y<Esc>gv", opts)    -- Control+C to copy selection then select again

-- Insert Mode
keymap("i", "<C-s>", "<Esc>:w<CR>", opts) -- Control+S to save

-- Terminal Mode
keymap("t", "<ESC>", "<C-\\><C-n>", opts)

