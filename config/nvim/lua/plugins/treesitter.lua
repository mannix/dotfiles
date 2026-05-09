-- nvim-treesitter v2 (rewrite, requires Neovim 0.12+)
-- The old nvim-treesitter.configs module is gone. setup() now only accepts
-- install_dir. Highlighting is Neovim-native (vim.treesitter) and is enabled
-- per-buffer via the FileType autocmd below.
--
-- Parser installation requires: tree-sitter-cli, curl, tar, C compiler
-- (see install.sh)

local langs = { 'lua', 'python', 'javascript', 'typescript', 'bash', 'go' }

-- Store parsers inside the config dir so they're reliably in runtimepath
require('nvim-treesitter').setup({
  install_dir = vim.fn.stdpath('config') .. '/ts_parsers',
})

-- Enable native treesitter highlighting when a matching file is opened.
-- pcall guards against missing parsers — they install async on first VimEnter.
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'lua', 'python', 'javascript', 'typescript', 'sh', 'go' },
  callback = function(ev)
    pcall(vim.treesitter.start, ev.buf)
  end,
})

-- Auto-install any missing parsers at startup (async, does not block editing)
vim.api.nvim_create_autocmd('VimEnter', {
  once = true,
  callback = function()
    local installed = {}
    for _, l in ipairs(require('nvim-treesitter.config').get_installed()) do
      installed[l] = true
    end
    local missing = vim.tbl_filter(function(l) return not installed[l] end, langs)
    if #missing > 0 then
      require('nvim-treesitter.install').install(missing)
    end
  end,
})
