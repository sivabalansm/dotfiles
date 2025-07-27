-- Load config

-- Neovim Settings
require("keybinds")
require("options")

-- Plugin manager
-- Plugins are loaded by lazy.nvim
-- the list of plugins is in ./lua/plugin/plugins.lua
require("plugin.install.lazy_bootstrap")
require("lazy").setup("plugin.plugins")


