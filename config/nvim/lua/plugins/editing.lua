require('mini.pairs').setup()
require('mini.surround').setup()

require('mini.clue').setup({
  triggers = {
    { mode = 'n', keys = '<Leader>' },
    { mode = 'x', keys = '<Leader>' },
    { mode = 'n', keys = 'g' },
    { mode = 'n', keys = '[' },
    { mode = 'n', keys = ']' },
    { mode = 'n', keys = '<C-w>' },
  },
  clues = {
    require('mini.clue').gen_clues.builtin_completion(),
    require('mini.clue').gen_clues.g(),
    require('mini.clue').gen_clues.windows(),
    -- Native comment keymaps (built-in since Neovim 0.10, no plugin needed)
    { mode = 'n', keys = 'gcc', desc = 'Comment line toggle' },
    { mode = 'n', keys = 'gc',  desc = 'Comment (operator)' },
    { mode = 'x', keys = 'gc',  desc = 'Comment selection toggle' },
  },
})
