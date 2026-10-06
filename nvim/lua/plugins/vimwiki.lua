vim.pack.add({'https://github.com/vimwiki/vimwiki'})

vim.g.vimwiki_list = {
    {
        path = '~/Documents/wiki',
        syntax = 'markdown',
        ext = '.md',
    },
}


vim.api.nvim_create_autocmd("FileType", {
  pattern = "vimwiki",
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.spelllang = { "de" , "en"}
  end,
})

local wk = require('which-key')
wk.add({'<leader>w', desc = 'vimwiki', icon = { icon = '󰖬', color = 'green' }})
