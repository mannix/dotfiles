local opt = vim.opt

-- Ensure tool directories are in PATH even when nvim is launched from an
-- environment that hasn't sourced the shell profile (e.g. after rustup install)
local extra_paths = {
  vim.fn.expand('~/.cargo/bin'),   -- cargo, tree-sitter-cli
  '/opt/homebrew/bin',             -- brew (macOS Apple Silicon)
  '/usr/local/bin',                -- brew (macOS Intel)
}
for _, p in ipairs(extra_paths) do
  if vim.uv.fs_stat(p) and not vim.env.PATH:find(p, 1, true) then
    vim.env.PATH = p .. ':' .. vim.env.PATH
  end
end

opt.number = true
opt.relativenumber = true

opt.expandtab = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2

opt.wrap = false

opt.hlsearch = true
opt.incsearch = true

-- Linux requires a clipboard provider: xclip/xsel (X11) or wl-clipboard (Wayland)
opt.clipboard = 'unnamedplus'

opt.termguicolors = true
opt.signcolumn = 'yes'
opt.updatetime = 250

opt.splitbelow = true
opt.splitright = true
