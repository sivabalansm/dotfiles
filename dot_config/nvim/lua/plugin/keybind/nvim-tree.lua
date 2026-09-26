local tree_api = require("nvim-tree.api")

vim.keymap.set("n", "<leader>t", tree_api.tree.toggle, { desc = "Nvim tree find files" })
