return{
  "nvim-tree/nvim-tree.lua",
  dependencies = { 'nvim-lua/plenary.nvim' },
  init = function ()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    local opts = { noremap = true, silent = true }
    local keymap = vim.api.nvim_set_keymap
    keymap("n", "<Leader>e", ":NvimTreeToggle<CR>", opts)
  end,
  opts = {
    respect_buf_cwd = true,
    filters = {
      git_ignored = false
    },
    renderer = {
      indent_markers = {
          enable = true,
      },
    },
    actions = {
      open_file = {
        quit_on_open = true,
      },
      expand_all = {
        exclude = {"node_modules", ".git", "build"}
      }
    },
    on_attach = function(bufnr)
      local api = require "nvim-tree.api"
      local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end
      -- default mappings
      api.config.mappings.default_on_attach(bufnr)

      -- custom mappings
      vim.keymap.set('n', '<F2>', api.fs.rename, opts('Rename'))
      vim.keymap.set('n', '<C-n>', api.fs.create, opts('Create'))
      vim.keymap.set('n', '<C-h>', api.node.open.horizontal, opts('Open: Horizontal Split'))
      -- vim.keymap.set('n', '<v>', api.node.open.vertical, opts('Open: Vertical Split'))
      -- vim.keymap.set('n', '<i>', api.tree.change_root_to_node, opts('CD'))
      -- vim.keymap.set('n', '<w>', api.tree.expand_all, opts('Expand All'))
      -- vim.keymap.set('n', '<c>', api.tree.collapse_all, opts('Collapse'))
      -- vim.keymap.set('n', '<o>', api.tree.change_root_to_parent, opts('Up'))
    end
      }
}
