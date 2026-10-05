require("config.options")
vim.cmd('runtime! lua/plugins/*.lua')


vim.pack.add({
    { src = 'https://github.com/uZer/pywal16.nvim' },
})

vim.cmd.colorscheme("pywal16")
