-- zeug 
-- vim.opt.laststatus = 2
-- vim.opt.cursorline = true
vim.opt.undofile = true

-- use spaces for tabs and whatnot
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.signcolumn = "yes"

--vim.opt.winborder = "rounded"

--Line numbers
vim.wo.number = true
vim.wo.relativenumber = true


--Window title
vim.opt.title = true
vim.opt.titlelen = 0
vim.opt.titlestring = "nvim %t"

--Use system clipboard
vim.opt.clipboard = "unnamedplus"

-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  callback = function()
      vim.highlight.on_yank({ higroup = "IncSearch", timeout = 300 })
  end,
})

--Spell check
local spell_types = { "text", "plaintex", "typst", "gitcommit", "markdown", "tex" }
vim.opt.spell = false
vim.api.nvim_create_augroup("Spellcheck", { clear = true })
vim.api.nvim_create_autocmd({ "FileType" }, {
    group = "Spellcheck", 
    pattern = spell_types,
    callback = function()
        vim.opt_local.spell = true
        vim.opt_local.spelllang = { "de" , "en"}
    end,
    desc = "Enable spellcheck for defined filetypes",
}
)
vim.api.nvim_create_autocmd("BufWinLeave", {
        pattern = "?*",
        callback = function()
               pcall(vim.cmd.mkview)
            end
    })
vim.api.nvim_create_autocmd("BufWinEnter", {
        pattern = "?*",
        callback = function()
               pcall(vim.cmd.loadview)
            end
    })
