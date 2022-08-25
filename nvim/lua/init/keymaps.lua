vim.g.mapleader = ' '
vim.keymap.set('i', ',.', '<esc>')

vim.keymap.set('n', '<leader>z', ':ZenMode<cr>')
vim.keymap.set('n', '<leader>u', ':Trouble workspace_diagnostics<cr>')
vim.keymap.set('n', '<leader>U', ':TodoTrouble<cr>')
vim.keymap.set('n', '<leader>L', ':LspRestart<cr>')
vim.keymap.set('n', '<leader>N', ':Neogit<cr>')
