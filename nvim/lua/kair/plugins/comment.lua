return {
  'numToStr/Comment.nvim',
  event = { "BufRead", "BufNewFile" },
  opts = {
    toggler = {
      line = "<F8><F8>",
      block = "<F7><F7>",
    },
    opleader = {
      line = "<F8>",
      block = "<F7>",
    },
    extra = {
      above = "<F8>O",
      below = "<F8>o",
      eol = "<F8>A",
    },
  }
}
