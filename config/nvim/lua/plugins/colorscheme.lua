-- return {
--     'metalelf0/jellybeans-nvim',
--     dependencies = {
--         {
--             'rktjmp/lush.nvim'
--         }
--     },
--     lazy = false,
--     priority = 1000,
--     config = function()
--         vim.cmd.colorscheme("jellybeans-nvim")
--     end,
-- }

return {
    'catppuccin/nvim',
    config = function()
        vim.cmd.colorscheme("catppuccin-latte")
    end,
}


-- return {
--     'projekt0n/github-nvim-theme',
--     config = function()
--         vim.cmd.colorscheme("github_light_default")
--     end,
-- }

-- return {
--     "folke/tokyonight.nvim",
--     lazy = false,
--     priority = 1000,
--     opts = {},
--     config = function()
--         vim.cmd.colorscheme("tokyonight-day")
--     end,
-- }
