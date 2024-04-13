return {
    'metalelf0/jellybeans-nvim',
    dependencies = {
        {
            'rktjmp/lush.nvim'
        }
    },
    lazy = false,
    priority = 1000,
    config = function()
        vim.cmd.colorscheme("jellybeans-nvim")
    end,
}
