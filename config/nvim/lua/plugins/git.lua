require('gitsigns').setup({
  signs = {
    add          = { text = '│' },
    change       = { text = '│' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
  },
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns
    local map = function(mode, keys, fn, desc)
      vim.keymap.set(mode, keys, fn, { buffer = bufnr, desc = 'Git: ' .. desc })
    end

    map('n', ']h', gs.next_hunk,        'Next Hunk')
    map('n', '[h', gs.prev_hunk,        'Previous Hunk')
    map('n', '<leader>hs', gs.stage_hunk,  'Stage Hunk')
    map('n', '<leader>hr', gs.reset_hunk,  'Reset Hunk')
    map('n', '<leader>hS', gs.stage_buffer, 'Stage Buffer')
    map('n', '<leader>hu', gs.undo_stage_hunk, 'Undo Stage Hunk')
    map('n', '<leader>hp', gs.preview_hunk, 'Preview Hunk')
    map('v', '<leader>hs', function()
      gs.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
    end, 'Stage Hunk (range)')
    map('v', '<leader>hr', function()
      gs.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
    end, 'Reset Hunk (range)')
  end,
})
