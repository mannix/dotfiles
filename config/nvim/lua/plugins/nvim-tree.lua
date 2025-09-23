vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  config = function()
    require("nvim-tree").setup({
      view = {
        adaptive_size = true,
      },
      vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<CR>')
    })
  end,
}
