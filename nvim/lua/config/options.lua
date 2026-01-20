-- Navigate vim panes better
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>', {silent = true})
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>', {silent = true})
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>', {silent = true})
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>', {silent = true})

vim.keymap.set('n', '<c-Left>', ':vertical-resize +5<CR>', {silent = true})
vim.keymap.set('n', '<c-Right>', ':vertical-resize -5<CR>', {silent = true})

-- vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- zeug 
vim.opt.backspace = '2'
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true
vim.opt.undofile = true

-- use spaces for tabs and whatnot
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true

vim.cmd [[ set noswapfile ]]
vim.cmd [[ set termguicolors ]]

--Line numbers
vim.wo.number = true
vim.wo.relativenumber = true

--Spell check
vim.opt_local.spell = true
vim.opt_local.spelllang = { "de" , "en"}

--Window title
vim.opt.title = true
vim.opt.titlelen = 0
vim.opt.titlestring = "nvim %t"

-- search for visually selected text with //
vim.keymap.set("v", "//", function()
  vim.cmd("normal! y")
  local text = vim.fn.getreg('"')
  text = vim.fn.escape(text, [[/\]])
  vim.fn.setreg("/", "\\V" .. text)
  vim.cmd("normal! n")
end, {
  silent = true,
  desc = "Search for visual selection",
})
vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 300 })
  end,
})
