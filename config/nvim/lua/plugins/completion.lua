-- blink.cmp v2 requires a compiled Rust native library (needs cargo in PATH).
-- On first launch after install, the library is built automatically below.
-- Subsequent launches skip the build check once the library is present.

local cmp = require('blink.cmp')

if not cmp.library_available() then
  vim.schedule(function()
    if vim.fn.executable('cargo') == 0 then
      vim.notify('blink.cmp: cargo not found — run ./install.sh first', vim.log.levels.ERROR)
      return
    end
    vim.notify('blink.cmp: building native library (~1 min)…', vim.log.levels.WARN)
    local ok, err = pcall(function() cmp.build():wait(60000) end)
    if ok then
      vim.notify('blink.cmp: build done — please restart Neovim', vim.log.levels.WARN)
    else
      vim.notify('blink.cmp: build failed — ' .. tostring(err), vim.log.levels.ERROR)
    end
  end)
  return
end

cmp.setup({
  keymap = { preset = 'default' },
  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer' },
  },
  completion = {
    documentation = { auto_show = true, auto_show_delay_ms = 200 },
  },
})
