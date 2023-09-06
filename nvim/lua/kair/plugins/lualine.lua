return {
  'nvim-lualine/lualine.nvim',
  dependencies = { {'nvim-tree/nvim-web-devicons'} },
  opts = {
    options = {
      icons_enabled = true,
      theme = 'tokyonight',
      component_separators = { left = '', right = '' },
      section_separators = { left = '', right = '' },
      disabled_filetypes = {
        statusline = { "nvim-tree" },
        winbar = {},
      },
      ignore_focus = {},
      always_divide_middle = true,
      globalstatus = true,
      refresh = {
        statusline = 1000,
        tabline = 1000,
        winbar = 1000,
      }
    },
    sections = {
      lualine_a = { {
        'mode',
        fmt = function(str)
          return str:sub(1, 1)
        end
      } },
      lualine_b = { 'branch', 'diff' },
      lualine_c = {
        {
          "filename",
          path = 3
        }
      },
      lualine_x = { 'diagnostics' },
      lualine_y = { 'progress' },
      lualine_z = { 'location' }
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { 'filename' },
      lualine_x = { 'location' },
      lualine_y = {},
      lualine_z = {}
    },
    tabline = {
      lualine_a = {
        {
          "buffers",
          hide_filename_extension = true,
        },
      }
    },
    winbar = {},
    inactive_winbar = {},
    extensions = {}
  }
}
