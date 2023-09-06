return {
    "lukas-reineke/indent-blankline.nvim",
    event = {"BufRead", "BufNewFile"},
    init = function ()
        vim.g = {
            indent_blankline_filetype_exclude = {"dashboard", "help"},
            indent_blankline_char = '┆',
            indent_blankline_space_char_blankline = '*',
            show_end_of_line = true
        }
    end,
    opts = {
        show_current_context = true,
    }
}
