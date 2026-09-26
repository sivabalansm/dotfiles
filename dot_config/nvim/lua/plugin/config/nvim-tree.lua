function on_attach(bufnr)
        local api = require("nvim-tree.api")
        local function opts(desc)
                return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end

        api.map.on_attach.default(bufnr)
        vim.keymap.set("n", "+", api.tree.change_root_to_node,        opts("Down"))
end

local config = {
        on_attach = on_attach,
}

require('nvim-tree').setup(config)
require("plugin.keybind.nvim-tree")
