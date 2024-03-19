return {
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
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
        { 'nvim-telescope/telescope-ui-select.nvim' },
        { 'nvim-tree/nvim-web-devicons', enabled = true },
    },
    config = function()
        -- Two important keymaps to use while in telescope are:
        --  - Insert mode: <c-/>
        --  - Normal mode: ?
        --
        -- This opens a window that shows you all of the keymaps for the current
        -- telescope picker. This is really useful to discover what Telescope can
        -- do as well as how to actually do it!

        require('telescope').setup {
            extensions = {
                ['ui-select'] = {
                    require('telescope.themes').get_dropdown(),
                },
            },
        }

        -- Enable telescope extensions, if they are installed
        pcall(require('telescope').load_extension, 'fzf')
        pcall(require('telescope').load_extension, 'ui-select')

        -- See `:help telescope.builtin`
        local builtin = require 'telescope.builtin'
        vim.keymap.set('n', '<leader>fh', builtin.help_tags)
        vim.keymap.set('n', '<leader>fk', builtin.keymaps)
        vim.keymap.set('n', '<leader>ff', builtin.find_files)
        vim.keymap.set('n', '<leader>fe', builtin.git_files)
        vim.keymap.set('n', '<leader>fw', builtin.grep_string)
        vim.keymap.set('n', '<leader>fg', builtin.live_grep)
        vim.keymap.set('n', '<leader>fd', builtin.diagnostics)
        vim.keymap.set('n', '<leader>sr', builtin.resume)
        vim.keymap.set('n', '<leader>f.', builtin.oldfiles)
        vim.keymap.set('n', '<leader><leader>', builtin.buffers)

        -- Also possible to pass additional configuration options.
        --  See `:help telescope.builtin.live_grep()` for information about particular keys
        vim.keymap.set('n', '<leader>s/', function()
            builtin.live_grep {
                grep_open_files = true,
                prompt_title = 'Live Grep in Open Files',
            }
        end, { desc = '[S]earch [/] in Open Files' })

        -- Shortcut for searching your neovim configuration files
        vim.keymap.set('n', '<leader>sn', function()
            builtin.find_files { cwd = vim.fn.stdpath 'config' }
        end, { desc = '[S]earch [N]eovim files' })
    end,
}
