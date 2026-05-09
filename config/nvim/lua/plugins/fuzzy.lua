local fzf = require('fzf-lua')
fzf.setup({ 'default' })

local map = vim.keymap.set
map('n', '<leader>ff', fzf.files,                { desc = 'Find Files' })
map('n', '<leader>fg', fzf.live_grep,            { desc = 'Live Grep' })
map('n', '<leader>fb', fzf.buffers,              { desc = 'Find Buffers' })
map('n', '<leader>fh', fzf.help_tags,            { desc = 'Help Tags' })
map('n', '<leader>fd', fzf.diagnostics_document, { desc = 'Document Diagnostics' })
map('n', '<leader>fs', fzf.lsp_document_symbols, { desc = 'LSP Symbols' })
map('n', '<leader>fr', fzf.lsp_references,       { desc = 'LSP References' })
