return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    init = function()
        local mode_fmt = function(str)
            if str == 'NORMAL' then
                return 'N'
            elseif str == 'INSERT' then
                return 'I'
            elseif str == 'VISUAL' then
                return 'V'
            elseif str == 'V-LINE' then
                return 'L'
            elseif str == 'V-BLOCK' then
                return 'B'
            elseif str == 'REPLACE' then
                return 'R'
            else
                return str
            end
        end

        local colors = {
            black = '#151515',
            red = '#cf6a4c',
            green = '#99ad6a',
            yellow = '#fad07a',
            blue = '#8197bf',
            magenta = '#c6b6ee',
            cyan = '#668799',
            white = '#e8e8d3',
            g1 = '#c6c6b5',
            g2 = '#B2B2A3',
            g3 = '#9D9D90',
            g4 = '#88887E',
            g5 = '#73736B',
            g6 = '#5F5F59',
            g7 = '#4A4A46',
            g8 = '#353533',
            g9 = '#202020',
        }

        local jb_theme = {
            normal = {
                a = { fg = colors.black, bg = colors.green, gui = 'bold' },
                b = { fg = colors.magenta, bg = colors.g8 },
                c = { fg = colors.g3, bg = colors.g9 },
                x = { fg = colors.g2, bg = colors.g9 },
                y = { fg = colors.g2, bg = colors.g8 },
                z = { fg = colors.g1, bg = colors.g7 },
            },
            insert =   { a = { fg = colors.black, bg = colors.red, gui = 'bold' } },
            visual =   { a = { fg = colors.black, bg = colors.yellow, gui = 'bold' } },
            command =  { a = { fg = colors.black, bg = colors.green, gui = 'bold' } },
            terminal = { a = { fg = colors.black, bg = colors.cyan, gui = 'bold' } },
            replace =  { a = { fg = colors.black, bg = colors.red, gui = 'bold' } },
            inactive = {
                c = { fg = colors.g4, bg = colors.g9 },
                x = { fg = colors.g4, bg = colors.g9 },
            }
        }


        require('lualine').setup {
            options = {
                icons_enabled = true,
                theme = jb_theme,
                section_separators = {},
                component_separators = {},
                disabled_filetypes = {
                    statusline = {},
                    winbar = {},
                },
                ignore_focus = {},
                always_divide_middle = true,
                always_show_tabline = true,
                globalstatus = false,
                refresh = {
                    statusline = 100,
                    tabline = 100,
                    winbar = 100,
                }
            },
            sections = {
                lualine_a = {
                    {
                        'mode',
                        fmt = mode_fmt,                    }
                    },
                    lualine_b = {'branch', 'diff', 'diagnostics'},
                    lualine_c = {
                        {
                            'filename',
                            file_status = true,
                            path = 1,
                        }
                    },
                    lualine_x = {'encoding', 'fileformat', 'filetype'},
                    lualine_y = {'lsp_status'},
                    lualine_z = {'location'}
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = {
                        {
                            'filename',
                            file_status = true,
                            path = 1,
                        }
                    },
                    lualine_x = {'location'},
                    lualine_y = {},
                    lualine_z = {}
                },
                tabline = {},
                winbar = {},
                inactive_winbar = {},
                extensions = {}
            }
        end,
    }
