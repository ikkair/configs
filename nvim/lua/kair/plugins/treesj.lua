return {
  'Wansmer/treesj',
  cmd = {"TSJToggle"},
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  init = function ()
    vim.keymap.set('n', '<leader>u', ':TSJToggle<CR>', {})
  end
  ,
  opts = {
    use_default_keymaps = false
  }
}
