-- load custom keybinds
require("plugin.keybind.lsp")

-- setup python LSP
require("lspconfig").pyright.setup{}

-- setup C and C++ LSP
require("lspconfig").ccls.setup{}

-- setup dart's built in lsp
-- require("lspconfig").dartls.setup({
-- 	cmd = { "/usr/bin/dart", "language-server", "--protocol=lsp" },
-- 
-- })



