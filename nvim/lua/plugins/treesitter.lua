return
{
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    opts = {
        auto_install = true,
        ensure_installed = {
            "css",
            "gitcommit",
            "gitignore",
            "http",
            "sql",
            "java",
            "lua",
            "json"
        },
    },
}
