return {
    "wtfox/jellybeans.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    init = function()
        vim.cmd.colorscheme 'jellybeans'
    end,
}
