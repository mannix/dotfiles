--vim.api.nvim_set_hl(0, 'IblIndent', { fg = '#292929' })
--vim.api.nvim_set_hl(0, 'IblScope', { fg = '#000000' })

return {
  'lukas-reineke/indent-blankline.nvim',
  main = 'ibl',
  opts = {
    indent = {
      char = '▏',
    },
    scope = {
      char = '▎',
      --highlight = { '@punctuation.bracket' },
      show_start = false,
      show_end = false,
      show_exact_scope = false,
    },
    exclude = {
      filetypes = {},
    },
  },
}
