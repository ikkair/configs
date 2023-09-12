return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  config = function()
    local ts_repeat_move = require "nvim-treesitter.textobjects.repeatable_move"

    -- Repeat movement with ; and ,
    -- ensure ; goes forward and , goes backward regardless of the last direction
    -- vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
    -- vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)

    -- vim way: ; goes to the direction you were moving.
    vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
    vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)

    -- Optionally, make builtin f, F, t, T also repeatable with ; and ,
    vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f)
    vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F)
    vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t)
    vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T)
    require("nvim-treesitter.configs").setup {
      ensure_installed = { "c", "lua", "vim", "vimdoc", "rust", "typescript", "go", "javascript", "html", "comment",
        "http", "json", "php", "regex", "sql", "toml", "bash", "java", "yaml", "dockerfile", "css", "tsx" },
      sync_install = false,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true
      },
      incremental_selection = {
        enable = false,
        keymaps = {
          init_selection = false,
          node_incremental = false,
          scope_incremental = false,
          node_decremental = false,
        },
      },
      -- nvim-treesitter-textobjects configs
      textobjects = {
        select = {
          enable = true,
          --   lookahead = true,
          keymaps = {
            ["ab"] = "@block.outer",
            ["ib"] = "@block.inner",
            ["ai"] = "@conditional.outer",
            ["ii"] = "@conditional.inner",
            ["al"] = "@loop.outer",
            ["il"] = "@loop.inner",
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = {
              query = "@class.inner",
              desc = "Select inner part of a class region",
            },
            ["as"] = {
              query = "@scope",
              query_group = "locals",
              desc = "Select language scope"
            },
            -- selection_modes = {
            --   ['@parameter.outer'] = 'v', -- charwise
            --   ['@function.outer'] = 'V',  -- linewise
            --   ['@class.outer'] = '<c-v>', -- blockwise
            -- },
            -- include_surrounding_whitespace = true,
          }
        },
        swap = {
          enable = false,
        },
        lsp_interop = {
          enable = true,
          border = "none",
          peek_definition_code = {
            ["<Leader>df"] = "@function.outer",
            ["<Leader>dF"] = "@class.outer",
          }
        },
        move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_next_start = {
            ["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
            ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
          },
          goto_next = {
            ["<F3>i"] = "@conditional.outer",
            ["<F3>b"] = "@block.outer",
            ["<F3>f"] = "@function.outer",
            ["<F3>l"] = "@loop.outer",
          },
          goto_previous = {
            ["<F3>B"] = "@block.outer",
            ["<F3>I"] = "@conditional.outer",
            ["<F3>F"] = "@function.outer",
            ["<F3>L"] = "@loop.outer",
          }
        },
      }
    }
  end,
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  event = { "BufNewFile", "BufRead" }
}
