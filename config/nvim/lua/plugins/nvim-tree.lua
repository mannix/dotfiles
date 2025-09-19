return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  config = function()
    require("nvim-tree").setup({
      vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<CR>')
    })
  end,
}
