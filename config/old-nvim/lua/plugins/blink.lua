return {
  'saghen/blink.cmp',
  event = 'VimEnter',
  version = '1.*',
  dependencies = {
    -- Snippet Engine
    {
      'L3MON4D3/LuaSnip',
      version = '2.*',
      build = (function()
        -- Build Step is needed for regex support in snippets.
        if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
          return
        end
        return 'make install_jsregexp'
      end)(),
      dependencies = {},
      opts = {},
    },
    'folke/lazydev.nvim',
  },
  --- @module 'blink.cmp'
  --- @type blink.cmp.Config
  opts = {
    keymap = {
      -- These are the keymaps for the 'default' preset
      -- ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
      -- ['<C-e>']     = { 'hide' },
      -- ['<C-y>']     = { 'select_and_accept' },
      -- ['<Up>']      = { 'select_prev', 'fallback' },
      -- ['<Down>']    = { 'select_next', 'fallback' },
      -- ['<C-p>']     = { 'select_prev', 'fallback_to_mappings' },
      -- ['<C-n>']     = { 'select_next', 'fallback_to_mappings' },
      -- ['<C-b>']     = { 'scroll_documentation_up', 'fallback' },
      -- ['<C-f>']     = { 'scroll_documentation_down', 'fallback' },
      -- ['<Tab>']     = { 'snippet_forward', 'fallback' },
      -- ['<S-Tab>']   = { 'snippet_backward', 'fallback' },
      -- ['<C-k>']     = { 'show_signature', 'hide_signature', 'fallback' },
      preset = 'default',
    },

    appearance = {
      -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- Adjusts spacing to ensure icons are aligned
      nerd_font_variant = 'mono',
    },

    completion = {
      -- By default, you may press `<c-space>` to show the documentation.
      -- Optionally, set `auto_show = true` to show the documentation after a delay.
      documentation = { auto_show = false, auto_show_delay_ms = 500 },
    },

    sources = {
      default = { 'lsp', 'path', 'snippets', 'lazydev' },
      providers = {
        lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 },
      },
    },

    snippets = { preset = 'luasnip' },

    -- Blink.cmp includes an optional, recommended rust fuzzy matcher,
    -- which automatically downloads a prebuilt binary when enabled.
    -- You may enable the rust implementation via `'prefer_rust_with_warning'`
    -- See :h blink-cmp-config-fuzzy for more information
    fuzzy = { implementation = 'lua' },

    -- Shows a signature help window while you type arguments for a function
    signature = { enabled = true },
  },
}
