local leet_arg = "leetcode.nvim"
return {
	{ "neovim/nvim-lspconfig",
	  config = function()
		  require("plugin.config.lsp")
	  end,
	},
	{ "mason-org/mason.nvim",
            keys = {
		    { "<Leader>m", ":Mason<CR>", desc = "Toggle Mason" },
	    },
	    config = function()
		    require("mason").setup()
	    end,
    	},
	{ "mason-org/mason-lspconfig.nvim",
          dependencies = {
                  { "mason-org/mason.nvim", opts = {} },
                  "neovim/nvim-lspconfig",
          },
          config = function()
                  require("mason-lspconfig").setup {
                          automatic_enable = true,
                          ensure_installed = { "lua_ls", "pyright", "cssls", "ts_ls" },
                  }
          end,
        },
        { "nvim-telescope/telescope.nvim",
            tag = "0.1.8",
            dependencies = { "nvim-lua/plenary.nvim" },
            config = function()
                    require("plugin.keybind.telescope")
            end,
        },
        { "hrsh7th/nvim-cmp",
            dependencies = {
               'neovim/nvim-lspconfig',
               'hrsh7th/cmp-nvim-lsp',
               'hrsh7th/cmp-buffer',
               'hrsh7th/cmp-path',
               'hrsh7th/cmp-cmdline',
            },
            config = function()
                    require("plugin.config.cmp")
            end,
        },
        { 'stevearc/conform.nvim',
            opts = {},
            config = function()
                    require("plugin.config.conform")
            end,
        },
        { 'nvim-lualine/lualine.nvim',
            dependencies = { 'nvim-tree/nvim-web-devicons' },
            config = function()
                    require("plugin.config.lualine")
            end,
        },
        { "kawre/leetcode.nvim",
            dependencies = {
                    "nvim-lua/plenary.nvim",
                    "MunifTanjim/nui.nvim",
                    "nvim-telescope/telescope.nvim"
            },
            lazy = leet_arg ~= vim.fn.argv(0, -1),
            opts = { arg = leet_arg },
        }
--  	{ "nvim-treesitter/nvim-treesitter",
--  	   config = function()
--  		   require("nvim-treesitter.configs").setup(require("plugin.config.treesitter"))
--  	   end,
--     	},
}
