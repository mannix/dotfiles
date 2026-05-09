-- Minimal native package bootstrapper using Neovim's built-in :h packages.
-- Clones missing plugins to the pack path on startup; subsequent loads are
-- instant because the directory already exists.
--
-- If you are on Neovim 0.12+ and prefer vim.pack, replace calls to
-- pack.add('user/repo') with the native vim.pack equivalent once the
-- 0.12 API stabilises.

local M = {}

-- Set to true if any plugin was cloned this session. When true, plugins/init.lua
-- skips all setup and asks for a restart — requiring a freshly cloned plugin in
-- the same Lua chunk that cloned it is not reliable.
M.bootstrapped = false

-- Plugins live inside the config directory because ~/.config/nvim is
-- unconditionally in packpath. The data dir (~/.local/share/nvim/site)
-- is also supposed to be in packpath but is less reliable across setups.
local pack_path = vim.fn.stdpath('config') .. '/pack/pkgs/start'
vim.fn.mkdir(pack_path, 'p')

function M.add(url)
  local name = url:match('[^/]+$'):gsub('%.git$', '')
  local path = pack_path .. '/' .. name
  if not vim.uv.fs_stat(path) then
    vim.notify('pack: installing ' .. name .. ' …', vim.log.levels.INFO)
    vim.fn.system({ 'git', 'clone', '--depth=1', 'https://github.com/' .. url, path })
    if vim.v.shell_error ~= 0 then
      vim.notify('pack: failed to clone ' .. url, vim.log.levels.ERROR)
      return
    end
    M.bootstrapped = true
  end
end

return M
