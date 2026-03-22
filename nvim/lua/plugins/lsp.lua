return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            {
                "folke/lazydev.nvim",
                ft = "lua",
                opts = {
                    library = {
                        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                    },
                },
            },
        },
        config = function()
            vim.lsp.config("ltex", {
                settings = {
                    ltex = {
                        language = "de-DE",
                    },
                },
            })
            vim.lsp.enable({ "lua_ls", "jdtls", "hyprls", "bashls", "csharp_ls", "html", "clangd" })

            -- ltex verzögert starten
            vim.api.nvim_create_autocmd("BufReadPost", {
                pattern = { "*.tex", "*.md", "*.txt", "*.org" },
                once = false,
                callback = function()
                    vim.defer_fn(function()
                        vim.lsp.enable("ltex")
                    end, 3000) -- 3 Sekunden warten
                end,
            })
        end,
        vim.keymap.set('n', '<space>ca', function()
            vim.lsp.buf.code_action() end, bufopts)
        },
        {
            "mason-org/mason.nvim",
            opts = {},
        },
    }
