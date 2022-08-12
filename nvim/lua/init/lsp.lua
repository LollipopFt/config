vim.lsp.buf.format({ async = true })

vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float,
    { noremap = true, desc = 'open_float' }
)
vim.keymap.set( 'n', '[d', vim.diagnostic.goto_prev,
    { noremap = true, desc = 'goto_prev' }
)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next,
    { noremap = true, desc = 'goto_next' }
)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist,
    { noremap = true, desc = 'setloclist' }
)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    vim.keymap.set('n', '<leader>d', vim.lsp.buf.definition,
        { noremap = true, buffer = bufnr, desc = 'definition' }
    )
    vim.keymap.set('n', '<leader>h', vim.lsp.buf.hover,
        { noremap = true, buffer = bufnr, desc = 'hover' }
    )
    vim.keymap.set('n', '<leader>i', vim.lsp.buf.implementation,
        { noremap = true, buffer = bufnr, desc = 'implementation' }
    )
    vim.keymap.set('n', '<leader>t', vim.lsp.buf.type_definition,
        { noremap = true, buffer = bufnr, desc = 'type_def' }
    )
    vim.keymap.set('n', '<leader>R', vim.lsp.buf.rename,
        { noremap = true, buffer = bufnr, desc = 'rename' }
    )
    vim.keymap.set('n', '<leader>c', vim.lsp.buf.code_action,
        { noremap = true, buffer = bufnr, desc = 'code_action' }
    )
    vim.keymap.set('n', '<leader>r', vim.lsp.buf.references,
        { noremap = true, buffer = bufnr, desc = 'references' }
    )
    vim.keymap.set('n', '<leader>f', vim.lsp.buf.format,
        { noremap = true, buffer = bufnr, desc = 'format' }
    )
end

require('cmp').setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end
    },
    mapping = require('cmp').mapping.preset.insert({
        ['<cr>'] = require('cmp').mapping.confirm({ select = true })
    }),
    sources = require('cmp').config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' }
    })
})

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

require('lspconfig').rust_analyzer.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        ['rust-analyzer'] = {
            checkOnSave = { command = 'clippy' }
        }
    }
}
