return {
    "wtfox/jellybeans.nvim",
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
        vim.cmd.colorscheme 'jellybeans'
    end,
}
