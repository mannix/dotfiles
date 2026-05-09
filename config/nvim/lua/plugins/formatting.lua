-- Formatters must be installed separately:
--   stylua:   brew install stylua
--   ruff:     brew install ruff  OR  pip install ruff
--   prettier: npm install -g prettier
--   gofmt:    included with Go (no install needed)

require('conform').setup({
  formatters_by_ft = {
    lua        = { 'stylua' },
    python     = { 'ruff_format' },
    javascript = { 'prettier' },
    typescript = { 'prettier' },
    go         = { 'gofmt' },
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
})
