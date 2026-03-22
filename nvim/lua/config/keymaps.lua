vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Navigate vim panes better
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>', {silent = true})
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>', {silent = true})
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>', {silent = true})
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>', {silent = true})

-- Resize
vim.keymap.set('n', '<c-Left>', ':vertical-resize +5<CR>', {silent = true})
vim.keymap.set('n', '<c-Right>', ':vertical-resize -5<CR>', {silent = true})


vim.keymap.set('n', '<M-j>', 'gj', {silent = true})
vim.keymap.set('n', '<M-k>', 'gk', {silent = true})

-- Close 
vim.keymap.set('n', '<c-c>', ':close<CR>', { desc = 'Source' })

-- Source file
vim.keymap.set('n', '<leader>o', ':update<CR> :source<CR>', { desc = 'Source' })

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>', { desc = 'Remove Highlights' })

vim.keymap.set('n', '<leader>w', ':w', {desc = 'Write'})
