-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

return {
    "nvim-tree/nvim-tree.lua",
    config = function()
        require("nvim-tree").setup({
            view = {
                width = 35,
                relativenumber = true,
            },
            renderer = {
                indent_markers = {
                    enable = true,
                },
            },
            filters = {
                custom = { ".DS_Store" },
            },
            git = {
                ignore = false,
            },
        })

        local keymap = vim.keymap
        keymap.set("n", "<C-e>", "<cmd>NvimTreeToggle<CR>")
        keymap.set("n", "<C-j>", "<cmd>NvimTreeFindFileToggle<CR>")
        keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>")
    end,
}

