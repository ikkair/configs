return {
  'nvim-pack/nvim-spectre',
  dependencies = {
    'nvim-lua/plenary.nvim'
  },
  init = function()
    vim.keymap.set('n', '<F3>p', '<CMD>lua require("spectre").toggle()<CR>', {})
    vim.keymap.set('n', '<F3>w', '<CMD>lua require("spectre").open_visual({select_word=true})<CR>', {})
    vim.keymap.set('v', '<F3>', '<CMD>lua require("spectre").open_visual()<CR>', {})
    vim.keymap.set('n', '<F3>f', '<CMD>lua require("spectre").open_file_search()<CR>', {})
  end,
}
