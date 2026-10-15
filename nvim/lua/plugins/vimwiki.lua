vim.pack.add({'https://github.com/vimwiki/vimwiki'})

vim.g.vimwiki_list = {
    {
        path = '~/Documents/wiki',
        syntax = 'markdown',
        ext = '.md',
    },
}


local wk = require('which-key')
wk.add({'<leader>w', desc = 'vimwiki', icon = { icon = '󰖬', color = 'green' }})
