-- Neovim 0.11+ native LSP setup. nvim-lspconfig provides lsp/*.lua files
-- (cmd, filetypes, root_dir) that vim.lsp.enable() picks up from rtp.
-- No require('lspconfig') needed.
--
-- Servers must be installed manually:
--   lua_ls:  brew install lua-language-server
--   pyright: npm install -g pyright
--   ts_ls:   npm install -g typescript typescript-language-server
--   bashls:  npm install -g bash-language-server
--   gopls:   go install golang.org/x/tools/gopls@latest

-- Keymaps applied to every LSP-attached buffer
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local map = function(keys, fn, desc)
      vim.keymap.set('n', keys, fn, { buffer = ev.buf, desc = 'LSP: ' .. desc })
    end
    map('gd',         vim.lsp.buf.definition,     'Go to Definition')
    map('gD',         vim.lsp.buf.declaration,     'Go to Declaration')
    map('gr',         vim.lsp.buf.references,      'References')
    map('gi',         vim.lsp.buf.implementation,  'Go to Implementation')
    map('K',          vim.lsp.buf.hover,           'Hover Docs')
    map('<leader>rn', vim.lsp.buf.rename,          'Rename Symbol')
    map('<leader>ca', vim.lsp.buf.code_action,     'Code Action')
    map('<leader>ds', vim.lsp.buf.document_symbol, 'Document Symbols')
    map('[d',         vim.diagnostic.goto_prev,    'Previous Diagnostic')
    map(']d',         vim.diagnostic.goto_next,    'Next Diagnostic')
  end,
})

-- lua_ls needs to know about the Neovim runtime to suppress false positives
vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT' },
      workspace = {
        checkThirdParty = false,
        library = vim.api.nvim_get_runtime_file('', true),
      },
      diagnostics = { globals = { 'vim' } },
    },
  },
})

vim.lsp.enable({ 'lua_ls', 'pyright', 'ts_ls', 'bashls', 'gopls' })
