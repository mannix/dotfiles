return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
        require("mason").setup {}
        require("mason-lspconfig").setup({
            ensure_installed = {
                "gopls", -- or "golangci_lint_ls"?
                "intelephense", -- or "phpactor"? or "psalm"?
                "tsserver",
                "html",
                "cssls",
                "lua_ls",
                "pyright",
            },
            -- auto-install configured servers (with lspconfig)
            automatic_installation = true, -- not the same as ensure_installed
        })
    end,
}
