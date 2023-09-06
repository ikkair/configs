return {
  "ThePrimeagen/harpoon",
  dependencies = {
    "nvim-lua/plenary.nvim"
  },
  init = function ()
    vim.keymap.set('n', '<leader>hm', '<CMD>lua require("harpoon.mark").add_file()<CR>', {})
    vim.keymap.set('n', '<leader>ht', '<CMD>lua require("harpoon.ui").toggle_quick_menu()<CR>', {})
  end,
  config = true
}
