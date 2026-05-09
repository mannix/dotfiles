-- nvim-lint supplements LSP diagnostics for languages where the language
-- server does not provide sufficient lint coverage:
--
--   python:     pyright is type-focused; ruff catches style/lint issues pyright misses
--   js/ts:      ts_ls does not enforce project-level eslint rules
--
-- Go, Lua, and Bash are NOT configured here because their language servers
-- (gopls, lua_ls, bashls) already produce comprehensive diagnostics.
--
-- Linters must be installed separately:
--   ruff:     brew install ruff  OR  pip install ruff
--   eslint_d: npm install -g eslint_d

local lint = require('lint')

lint.linters_by_ft = {
  python     = { 'ruff' },
  javascript = { 'eslint_d' },
  typescript = { 'eslint_d' },
}

vim.api.nvim_create_autocmd({ 'BufWritePost', 'BufReadPost', 'InsertLeave' }, {
  callback = function()
    lint.try_lint()
  end,
})
