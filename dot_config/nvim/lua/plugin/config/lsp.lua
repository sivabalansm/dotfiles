-- load custom keybinds
require("plugin.keybind.lsp")

local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- setup python LSP
require("lspconfig").pyright.setup({
    capabilities = capabilities,
})
--[[
]]--

-- setup C and C++ LSP
require("lspconfig").ccls.setup{}

-- setup Kotlin lsp
require("lspconfig").kotlin_language_server.setup{}

-- setup dart's built in lsp
-- require("lspconfig").dartls.setup({
-- 	cmd = { "/usr/bin/dart", "language-server", "--protocol=lsp" },
-- 
-- })



