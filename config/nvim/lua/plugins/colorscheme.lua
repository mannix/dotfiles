return {
  {
    'wtfox/jellybeans.nvim',
    lazy = false,
    priority = 1000,
    opts = {
      flat_ui = false,
      on_highlights = function(hl, c)
        hl.LspReferenceText = { bg = '#363B2B', bold = true }
        hl.LspReferenceRead = { fg = '#FBDC9D', bg = '#4F442F', bold = false }
        hl.LspReferenceWrite = { fg = '#D4795E', bg = '#442B23', bold = false }
      end,
    },
    init = function()
      --vim.cmd.colorscheme 'jellybeans'
    end,
  },
  {
    "vague2k/vague.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other plugins
    config = function()
      -- NOTE: you do not need to call setup if you don't want to.
      require("vague").setup({
        -- optional configuration here
      })
      vim.cmd("colorscheme vague")
    end
  }
}
