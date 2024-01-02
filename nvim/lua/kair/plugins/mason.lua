return {
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
      'hrsh7th/cmp-nvim-lsp',
    },
    init = function()
      require("mason").setup()
      require("mason-lspconfig").setup{
        ensure_installed = {
          -- languages
          "lua_ls", "rust_analyzer", "clangd", "gopls", "jdtls", "tsserver",
          -- web dev
          "cssls", "cssmodules_ls", "html", "sqlls", "tailwindcss",
          -- configs
          "dockerls", "yamlls", "taplo", "rnix", "bashls"
        }
      }

      -- Global mappings.
      -- See `:help vim.diagnostic.*` for documentation on any of the below functions
      vim.keymap.set('n', '<Leader>d', vim.diagnostic.open_float)
      vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
      vim.keymap.set('n', ']d', vim.diagnostic.goto_next)

      -- Diagnostic custom signs
      vim.cmd([[
        sign define DiagnosticSignError text= texthl=DiagnosticSignError
        sign define DiagnosticSignWarn text= texthl=DiagnosticSignWarn
        sign define DiagnosticSignHint text= texthl=DiagnosticSignHint
        sign define DiagnosticSignInfo text= texthl=DiagnosticSignInfo
      ]])

      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      capabilities.workspace = capabilities.workspace or {}
      capabilities.workspace.didChangeWatchedFiles = { dynamicRegistration = true }
      require("mason-lspconfig").setup_handlers{
        function (server_name)
          require("lspconfig")[server_name].setup{
            capabilities = capabilities,
          }
        end,
        ["lua_ls"] = function ()
          require("lspconfig")["lua_ls"].setup{
            capabilities = capabilities,
            settings = {
              Lua = {
                diagnostics = {
                  globals = {"vim"},
                }
              }
            }
          }
        end
      }

      -- Use LspAttach autocommand to only map the following keys
      -- after the language server attaches to the current buffer
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          -- Enable completion triggered by <c-x><c-o>
          vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

          -- Buffer local mappings.
          -- See `:help vim.lsp.*` for documentation on any of the below functions
          local opts = { buffer = ev.buf }
          vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
          vim.keymap.set('n', '<Leader>i', vim.lsp.buf.hover, opts)
          vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
          vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
          vim.keymap.set('n', '<Leader>wa', vim.lsp.buf.add_workspace_folder, opts)
          vim.keymap.set('n', '<Leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
          vim.keymap.set('n', '<Leader>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          end, opts)
          vim.keymap.set('n', '<Leader>D', vim.lsp.buf.type_definition, opts)
          vim.keymap.set('n', '<Leader>rn', vim.lsp.buf.rename, opts)
          vim.keymap.set({ 'n', 'v' }, '<Leader>ca', vim.lsp.buf.code_action, opts)
          vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
          vim.keymap.set('n', '<Leader>f', function()
            vim.lsp.buf.format { async = true }
          end, opts)
        end,
      })

    end
  },
}
