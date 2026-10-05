vim.fn.serverstart()

vim.opt.cursorline = true
vim.opt.undofile = true

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.complete:append('o')
vim.opt.autocomplete = true
vim.opt.completeopt = { 'menuone', 'noselect' }

vim.opt.pumheight = 5
vim.opt.pumborder = 'rounded'


vim.keymap.set('n', '<leader>s', ':w<CR>:source %<CR>')

vim.opt.clipboard = "unnamedplus"

vim.wo.number = true
vim.wo.relativenumber = true
vim.opt.signcolumn = "yes"

vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  callback = function()
      vim.highlight.on_yank({ higroup = "IncSearch", timeout = 300 })
  end,
})

vim.cmd [[
  highlight Normal guibg=none
  highlight NonText guibg=none
  highlight Normal ctermbg=none
  highlight NonText ctermbg=none
]]


vim.opt_local.spell = true
vim.opt_local.spelllang = { "de" , "en"}

