return {
  "akinsho/toggleterm.nvim",
  version = "*",
  cmd = {"ToggleTerm"},
  opts = {
    start_in_insert = false,
    size = function(term)
      if term.direction == "horizontal" then
        return 15
      elseif term.direction == "vertical" then
        return vim.o.columns * 0.4
      end
    end,
  },
  init = function()
    local opts = {
      silent = true,
      noremap = true
    }
    function TerminalNumber()
      local char = vim.fn.getchar()
      if char >= 48 and char <= 57 then
        local direc = vim.fn.getchar()
        if direc == 104 then
          return ":ToggleTerm" .. vim.fn.nr2char(char) .. " direction=horizontal<CR>"
        elseif direc == 102 then
          return ":ToggleTerm" .. vim.fn.nr2char(char) .. " direction=float<CR>"
        elseif direc == 118 then
          return ":ToggleTerm" .. vim.fn.nr2char(char) .. " direction=vertical<CR>"
        else
          return ":ToggleTerm" .. vim.fn.nr2char(char) .. "<CR>"
        end
      end
    end

    vim.keymap.set('n', '<F13>', 'v:lua.TerminalNumber()', { silent = true, noremap = true, expr = true })
    vim.keymap.set('n', '<F13><F13>', ':ToggleTerm<CR>', opts)
    vim.keymap.set('n', '<F13>h', ':ToggleTerm direction=horizontal<CR>', opts)
    vim.keymap.set('n', '<F13>f', ':ToggleTerm direction=float<CR>', opts)
    vim.keymap.set('n', '<F13>v', ':ToggleTerm direction=vertical<CR>', opts)
    vim.keymap.set('n', '<F13>a', ':ToggleTermToggleAll<CR>', opts)
  end,
  config = true
}
