return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  config = function()
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
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outerr",
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
          enable = true,
          swap_next = {
            ["<Leader>s"] = "@parameter.inner",
          },
          swap_previous = {
            ["<Leader>S"] = "@parameter.inner",
          },
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
            ["j"] = "@function.outer",
            ["J"] = { query = "@class.outer", desc = "Next class start" },
            --
            -- You can use regex matching (i.e. lua pattern) and/or pass a list in a "query" key to group multiple queires.
            ["]o"] = "@loop.*",
            -- ["]o"] = { query = { "@loop.inner", "@loop.outer" } }
            --
            -- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
            -- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
            ["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
            ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
          },
          goto_next_end = {
            ["l"] = "@function.outer",
            ["L"] = "@class.outer",
          },
          goto_previous_start = {
            ["k"] = "@function.outer",
            ["K"] = "@class.outer",
          },
          goto_previous_end = {
            ["h"] = "@function.outer",
            ["H"] = "@class.outer",
          },
          -- Below will go to either the start or the end, whichever is closer.
          -- Use if you want more granular movements
          -- Make it even more gradual by adding multiple queries and regex.
          goto_next = {
            ["]d"] = "@conditional.outer",
          },
          goto_previous = {
            ["[d"] = "@conditional.outer",
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