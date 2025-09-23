-- Custom colorscheme

local custom_16colors = require("lualine.themes.16color")
custom_16colors.normal.a.bg = "#55bcce"
require('lualine').setup({
        options = {
                theme = custom_16colors,
        },
        sections = {
                lualine_c = {
                        {
                                'buffers',
                                buffers_color = {
                                        active = { fg = '#000000', bg = '#ffff00' },
                                        inactive = 'lualine_c_inactive',
                                },
                        }
                }
        }
})
