return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {},
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = false,
  init = function()
      vim.keymap.set("n", "-", "<cmd>Oil<CR>")
  end,
}
