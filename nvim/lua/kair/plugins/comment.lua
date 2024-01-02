return {
  'numToStr/Comment.nvim',
  event = { "BufRead", "BufNewFile" },
  opts = {
    toggler = {
      -- line = "<F8><F8>",
      line = "<F7><F7>",
    },
    opleader = {
      -- line = "<F8>",
      line = "<F7>",
    },
    extra = {
      above = "<F7>O",
      below = "<F7>o",
      eol = "<F7>A",
    },
  }
}
