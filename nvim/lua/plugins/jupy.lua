return{
    "dccsillag/magma-nvim",
    lazy = false,
    config = function ()
        vim.keymap.set("n", "<LocalLeader>r",  ":MagmaEvaluateOperator<CR>")
        vim.keymap.set("n", "<LocalLeader>rr", ":MagmaEvaluateLine<CR>")
        vim.keymap.set("n", "<LocalLeader>r",  ":<C-u>MagmaEvaluateVisual<CR>")
        vim.keymap.set("n", "<LocalLeader>rc", ":MagmaReevaluateCell<CR>")
        vim.keymap.set("n", "<LocalLeader>rd", ":MagmaDelete<CR>")
        vim.keymap.set("n", "<LocalLeader>ro", ":MagmaShowOutput<CR>")

        --let g:magma_automatically_open_output = v:false
        --let g:magma_image_provider = "ueberzug"
        vim.g.magma_automatically_open_output = false
    end
}
