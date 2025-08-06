-- Options
vim.o.number = true
vim.o.relativenumber = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.expandtab = true
vim.o.timeout = false -- to make timeouts for the leaker key infinite
vim.o.filetype = "on"
vim.cmd([[filetype plugin on]])

-- Set legacy default colorscheme (changed in neovim version 0.10 and above)
vim.cmd([[colorscheme vim]])

-- Remove auto commenting
vim.cmd([[autocmd FileType * set formatoptions-=ro]])

-- Change Pop up menu color
vim.api.nvim_set_hl(0, "Pmenu", {})

-- Completion function default
vim.o.omnifunc = "syntaxcomplete#Complete"

-- autocomplete windows will be in a popup window instead of preview buffers
vim.o.completeopt = "menu,popup"

-- Add window borders everywhere
vim.o.winborder = 'rounded'
