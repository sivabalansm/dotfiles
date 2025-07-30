-- Keybindings

-- Leader key
vim.g.mapleader = " "



-- Normal mode

-- reload configuration
-- Note: Not supported in lazy.nvim
-- vim.keymap.set("n", "<Leader>r", ":source ~/.config/nvim/init.lua<CR>")

-- highlight toggle feature
vim.keymap.set("n", "<Leader>H", function() if vim.o.hls then vim.o.hls = false else vim.o.hls = true end; end)

-- clipboard register + middle mouse register (X window systems) activation in different modes
vim.keymap.set("n", "<Leader>c", '"+')
vim.keymap.set("v", "<Leader>c", '"+')
vim.keymap.set("n", "<Leader>C", '"*')
vim.keymap.set("v", "<Leader>C", '"*')

-- Window splits
vim.keymap.set("n", "<Leader>'", ":vsplit ")
vim.keymap.set("n", '<Leader>"', ":split ")

-- Set Filetype via user input
vim.keymap.set("n", "<Leader>F", function() vim.ui.input({ prompt = 'Filetype: ' }, function(input) vim.o.filetype = input end) end)

-- Save
vim.keymap.set("n", "zz", ":update<CR>")


-- Command mode

-- Going in any direction with vi like bindings
vim.keymap.set("c", "<C-k>", "<Up>")
vim.keymap.set("c", "<C-j>", "<Down>")
vim.keymap.set("c", "<C-h>", "<Left>")
vim.keymap.set("c", "<C-l>", "<Right>")

