vim.pack.add({'https://github.com/nvim-tree/nvim-tree.lua'})
require("nvim-tree").setup {
    on_attach = function(bufnr)
        local api = require("nvim-tree.api")
        vim.keymap.set("n", "l", api.node.open.edit, { desc = "nvim-tree: Open", buffer = bufnr, noremap = true, silent = true, nowait = true})
        vim.keymap.set("n", "h", api.node.navigate.parent_close, { desc = "nvim-tree: Open", buffer = bufnr, noremap = true, silent = true, nowait = true} )
    end
}
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "nvim-tree: Open", buffer = bufnr, noremap = true, silent = true, nowait = true} )

