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

-- Move between buffers
vim.keymap.set("n", "<Leader>n", ":bnext<CR>")
vim.keymap.set("n", "<Leader>p", ":bprev<CR>")
vim.keymap.set("n", "<Leader>q", ":bd<CR>")

-- Window splits
vim.keymap.set("n", "<Leader>'", ":vsplit ")
vim.keymap.set("n", '<Leader>"', ":split ")

-- Set Filetype via user input
vim.keymap.set("n", "<Leader>F", function() vim.ui.input({ prompt = 'Filetype: ' }, function(input) vim.o.filetype = input end) end)

-- Save
vim.keymap.set("n", "zz", ":update<CR>")

-- Create new files in current buffer directory
vim.keymap.set("n", "<Leader>N", function() 
        local dir = vim.fn.expand("%:h")
        local name = vim.fn.input("New file in " .. dir .. "/: ")
        if name == "" then return end
        vim.cmd("edit " .. vim.fn.fnameescape(dir .. "/" .. name))
end, { desc = "New file in current buffer directory" })

-- Rename files in current buffer directory
vim.keymap.set("n", "<Leader>R", function()
        local oldPathFileName = vim.fn.expand("%:p")
        if oldPathFileName == "" then return end

        local dir = vim.fn.fnamemodify(oldPathFileName, ":h")
        local oldFileName = vim.fn.fnamemodify(oldPathFileName, ":t")

        local newFileName = vim.fn.input("New file name for " .. oldFileName .. ": ", oldPathFileName, "file")
        if newFileName == "" or newFileName == oldFileName then return end

        if vim.bo.modified then vim.cmd("write") end

        local ok, err = os.rename(oldPathFileName, newFileName)

        if not ok then
                vim.notify("Rename failed: " .. (err or ""), vim.log.levels.ERROR)
                return
        end

        vim.cmd("edit " .. vim.fn.fnameescape(newFileName))
        vim.cmd("bdelete!" .. vim.fn.fnameescape(oldPathFileName))
end, { desc = "Rename current file to" })


-- Command mode

-- Going in any direction with vi like bindings
vim.keymap.set("c", "<C-k>", "<Up>")
vim.keymap.set("c", "<C-j>", "<Down>")
vim.keymap.set("c", "<C-h>", "<Left>")
vim.keymap.set("c", "<C-l>", "<Right>")



