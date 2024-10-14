local on_attach = function()
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover)
    vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float)

    vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
    vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references)

    vim.keymap.set('n', '<leader>ls', require('telescope.builtin').lsp_dynamic_workspace_symbols)

    vim.keymap.set('n', '<F2>', vim.lsp.buf.rename)
end

require('mason-lspconfig').setup_handlers({
    function(server_name)
        require('lspconfig')[server_name].setup({
            on_attach = on_attach
        })
    end
})
