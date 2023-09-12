return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.2',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'ahmedkhalf/project.nvim'
  },
  cmd = "Telescope",
  init = function()
    local opts = {
      silent = true,
      noremap = true,
    }
    vim.keymap.set('n', '<leader>ff', ':Telescope find_files<CR>', opts)
    vim.keymap.set('n', '<leader>fo', ':Telescope oldfiles<CR>', opts)
    vim.keymap.set('n', '<leader>fs', ':Telescope live_grep<CR>', opts)
    vim.keymap.set('n', '<leader>fg', ':Telescope git_files<CR>', opts)
    vim.keymap.set('n', '<leader>fb', ':Telescope buffers<CR>', opts)
    vim.keymap.set('n', '<leader>fh', ':Telescope help_tags<CR>', opts)
    vim.keymap.set('n', '<leader>fd', ':Telescope diagnostics<CR>', opts)
    vim.keymap.set('n', '<leader>fc', ':Telescope find_files cwd=~/.config/nvim<CR>', opts)
    vim.keymap.set('n', '<leader>fp', ':Telescope projects<CR>', opts)
  end,
  config = function()
    require("project_nvim").setup {}
    require("telescope").setup {
      pickers = {
        find_files = {
          hidden = true,
          no_ignore = true,
        },
      },
      defaults = {
        layout_strategy = "vertical",
        layout_config = {
          preview_cutoff = 0
        },
        file_ignore_patterns = { "node_modules/", "git/" },
      },
    }
    require("telescope").load_extension("projects")
  end
}
