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
