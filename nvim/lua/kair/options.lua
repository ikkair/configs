local options = {
  backup = false,        --Prevent unnecesarry backup file
  -- cmdheight = 1,         --CMD below height
  conceallevel = 0,      --To prevent text concealed
  fileencoding = "utf-8",
  hlsearch = false,       --To prevent unnecesary highlighting
  ignorecase = false,    --To ensure accurate search
  mouse = "n",           --Enable mouse in all mode
  pumheight = 10,        --Max number item in popup menu
  showtabline = 0,       --To always show top info tab
  smartcase = true,      --To broaden the search when there is uppercase
  smartindent = true,    --Smart auto indenting when starting new line
  splitbelow = true,     --Split to below
  splitright = true,     --Split to right
  swapfile = false,      --To savely open heavy file
  timeoutlen = 1000,
  undofile = true,       --To can always undo to a file
  updatetime = 300,      --Swapfile update interval
  writebackup = false,   --Prevent unnecesarry backup file
  expandtab = true,      --Change every tab to spaces in normal mode
  shiftwidth = 2,        --Number of spaces when shift are performed
  tabstop = 2,           --Number of spaces when tab is pressed in normal mode
  cursorline = true,     --To Deactivate Cursorline
  number = true,         --Showing line number
  relativenumber = false, --Set line number to relative
  numberwidth = 4,       --Set spaces between line number and code
  signcolumn = "yes",    --To enable error icon beside number line
  wrap = true,           --To prevent wrapping text
  scrolloff = 5,         --Minimal number of screen lines to keep above and below the cursor
  sidescrolloff = 5,     --The minimal number of screen columns to keep to the left and to the right of the cursor
  background = "dark",   --Dark Background
}

-- function RelativeLineOff()
--   vim.wo.relativenumber = false
--   vim.cmd.redraw()
-- end

vim.cmd([[
  " augroup RelativeLineToggle
  "   autocmd!
  "   autocmd CmdlineEnter : lua RelativeLineOff()
  "   autocmd CmdlineLeave : set relativenumber
  " augroup END
  augroup HighlightSearchToggle
    autocmd!
    autocmd CmdlineEnter / set hlsearch
    autocmd CmdlineLeave / set nohlsearch
  augroup END
]])

-- Iterate over the options then implement it
for key, value in pairs(options) do
  vim.opt[key] = value
end
