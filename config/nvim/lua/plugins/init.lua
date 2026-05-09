local pack = require('pack')

-- Pass 1: ensure all plugins are installed.
-- These are all idempotent — already-cloned plugins are skipped.
pack.add('EdenEast/nightfox.nvim')
pack.add('nvim-treesitter/nvim-treesitter')
pack.add('neovim/nvim-lspconfig')
pack.add('Saghen/blink.lib')
pack.add('Saghen/blink.cmp')
pack.add('ibhagwan/fzf-lua')
pack.add('lewis6991/gitsigns.nvim')
pack.add('echasnovski/mini.nvim')
pack.add('stevearc/conform.nvim')
pack.add('mfussenegger/nvim-lint')

-- If anything was just cloned, requiring it in the same session is unreliable.
-- Restart so Neovim loads the new plugins from packpath on a clean start.
if pack.bootstrapped then
  vim.schedule(function()
    vim.notify('Plugins installed — please restart Neovim.', vim.log.levels.WARN)
  end)
  return
end

-- Pass 2: configure plugins (only runs when all plugins are already present).
require('plugins.theme')
require('plugins.treesitter')
require('plugins.lsp')
require('plugins.completion')
require('plugins.fuzzy')
require('plugins.git')
require('plugins.statusline')
require('plugins.formatting')
require('plugins.linting')
require('plugins.editing')
