return {
	{ "neovim/nvim-lspconfig",
	  config = function() 
		  require("plugin.config.lsp")
	  end,
	},
	{ "williamboman/mason.nvim",
            keys = {
		    { "<Leader>m", ":Mason<CR>", desc = "Toggle Mason" },
	    },
	    config = function() 
		    require("mason").setup()
	    end,
    	},
	{ "williamboman/mason-lspconfig.nvim",
	    config = function() 
		    require("mason-lspconfig").setup()
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
--  	{ "nvim-treesitter/nvim-treesitter",
--  	   config = function()
--  		   require("nvim-treesitter.configs").setup(require("plugin.config.treesitter"))
--  	   end,
--     	},
--	{ "akinsho/flutter-tools.nvim",
--	   lazy = false,
--	   dependencies = {
--		   "nvim-lua/plenary.nvim",
--	   },
--	   config = function()
--			require("flutter-tools").setup{}
--	   end,
--	},
}
