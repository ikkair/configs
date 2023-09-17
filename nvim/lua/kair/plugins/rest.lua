return {
  "rest-nvim/rest.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  ft = { "http" },
  config = function()
    require("rest-nvim").setup({
      result_split_horizontal = false,
      result_split_in_place = false,
      skip_ssl_verification = false,
      highlight = {
        enabled = true,
        timeout = 200
      },
      jump_to_request = true,
      env_file = ".env.request",
      yank_dry_run = true,
      result = {
        show_url = true,
        show_curl_command = true,
        show_http_info = true,
        show_headers = false,
        formatters = {
          json = "jq"
        }
      },
      custom_dynamic_variables = {
        ["form_boundary"] = function()
          local charset = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
          local boundary = "----"
          math.randomseed(os.time())
          for _ = 1, 16 do
            local randChar = charset:sub(math.random(1, #charset), math.random(1, #charset))
            boundary = boundary .. randChar
          end
          return boundary
        end
      }
    })
    function KeymapSetterBuf()
      local opts = { noremap = true, silent = true }
      local keymap = vim.api.nvim_buf_set_keymap
      keymap(0, "n", "<F5>", [[:lua require("rest-nvim").run()<CR>]], opts)
    end

    vim.cmd [[
      autocmd FileType http lua KeymapSetterBuf()
    ]]
  end
}
