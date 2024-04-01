return {
    'ggandor/leap.nvim',
    config = function()
        vim.keymap.set({'n', 'x', 'o'}, 's',  '<Plug>(leap-forward)')
        vim.keymap.set({'n', 'x', 'o'}, '<leader>s',  '<Plug>(leap-backward)')
        vim.keymap.set({'n', 'x', 'o'}, 'gs', '<Plug>(leap-from-window)')
    end
}
