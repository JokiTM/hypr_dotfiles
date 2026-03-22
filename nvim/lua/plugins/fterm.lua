return{
    "numToStr/FTerm.nvim",

    config = function()
        require("FTerm").setup({
            border = 'rounded',
        })
        vim.keymap.set('n', '<leader>t', '<CMD>lua require("FTerm").toggle()<CR>', { desc = 'Open Terminal' })
        vim.keymap.set('t', '<leader>t', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', { desc = 'Open Terminal' })
    end
}
