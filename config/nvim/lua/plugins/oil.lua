return {
    'stevearc/oil.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function ()
        require("oil").setup {
            keymaps = {
                ["<C-l>"] = "actions.preview",
                ["<C-p>"] = false
            },
        }
        vim.keymap.set("n", "-", "<CMD>Oil<CR>")
    end
}
