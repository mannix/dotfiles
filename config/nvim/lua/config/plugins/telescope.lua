return {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make',
            cond = function()
                return vim.fn.executable 'make' == 1
            end,
        },
    },
    config = function()
        local k = vim.keymap
        k.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
        k.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>")
        k.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>")
        k.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>")
        k.set("n", "<C-p>", "<cmd>Telescope git_files<cr>")
        k.set("n", "<leader>vh", "<cmd>Telescope help_tags<cr>")
    end,
}
