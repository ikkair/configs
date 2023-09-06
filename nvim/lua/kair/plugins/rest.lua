return {
  "rest-nvim/rest.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  ft = {"http"},
  config = function ()
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
        show_curl_command = false,
        show_http_info = true,
        show_headers = false,
        formatters = {
          json = "jq"
        }
      },
    })
    local opts = { noremap = true, silent = true }
    local keymap = vim.api.nvim_set_keymap
    keymap("n", "<F5>", [[:lua require("rest-nvim").run()<CR>]], opts)
  end
}
