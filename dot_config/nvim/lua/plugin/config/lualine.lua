-- Custom colorscheme

local custom_16colors = require("lualine.themes.16color")
custom_16colors.normal.a.bg = "#55bcce"
require('lualine').setup({
        options = {
                theme = custom_16colors,
        },
        sections = {
                lualine_a = {
                        {
                                'buffers',
                        }
                }
        }
})
