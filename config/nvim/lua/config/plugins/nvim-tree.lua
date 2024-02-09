-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("nvim-tree").setup({
            view = {
                width = 40,
                relativenumber = true,
            },
            renderer = {
                indent_markers = {
                    enable = true,
                },
            },
        })

        local k = vim.keymap
        k.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>")
        k.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>")
        k.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>")
        k.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>")
    end,
}
