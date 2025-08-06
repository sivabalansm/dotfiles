-- Set diagnostic information
vim.keymap.set('n', '<Leader>do', vim.diagnostic.open_float)
vim.keymap.set('n', '<Leader>dp', vim.diagnostic.goto_prev)
vim.keymap.set('n', '<Leader>dn', vim.diagnostic.goto_next)
vim.keymap.set('n', '<Leader>dl', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {

  group = vim.api.nvim_create_augroup('UserLspConfig', {}),

  callback = function(ev)

    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n',          '<Leader>lD', 	vim.lsp.buf.declaration,             opts)
    vim.keymap.set('n',          '<Leader>ld', 	vim.lsp.buf.definition,              opts)
    vim.keymap.set('n',          '<Leader>li', 	vim.lsp.buf.implementation,          opts)
    vim.keymap.set('n',          'K', 	       	vim.lsp.buf.hover,                   opts)
    vim.keymap.set('n',          '<C-k>',      	vim.lsp.buf.signature_help,          opts)
    vim.keymap.set('n',          '<Leader>wa', 	vim.lsp.buf.add_workspace_folder,    opts)
    vim.keymap.set('n',          '<Leader>wr', 	vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n',          '<Leader>wl', 	function() 
	    		         	       	 print(vim.inspect(vim.lsp.buf.list_workspace_folders())) 
			         	       	end,                                 opts)
    vim.keymap.set('n',          '<Leader>lt', 	vim.lsp.buf.type_definition,         opts)
    vim.keymap.set('n',          '<Leader>lre', vim.lsp.buf.rename,                  opts)
    vim.keymap.set({ 'n', 'v' }, '<Leader>lc',  vim.lsp.buf.code_action,             opts)
    vim.keymap.set('n',          '<Leader>lrf', vim.lsp.buf.references,              opts)
    vim.keymap.set('n',          '<Leader>lf',  function()
                                                 vim.lsp.buf.format { async = true }
                                                end,                                 opts)
  end,
})

-- Add rounded corners
vim.diagnostic.config {
        virtual_text = false,
        float = {
                header = false,
                border = 'rounded',
                focusable = true,
        },
}
