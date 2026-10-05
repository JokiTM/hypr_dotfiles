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

            vim.lsp.config('rust-analyzer', {
                settings = {
                    ['rust-analyzer'] = {
                        diagnostics = {
                            enable = true;
                        }
                    }
                }
            })
            vim.lsp.enable({ "lua_ls", "jdtls", "hyprls", "bashls", "csharp_ls", "html", "clangd", "rust-analyzer", "pylsp", "gopls" })

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
        vim.keymap.set('n', '<space>ca', function() vim.lsp.buf.code_action() end, {desc = ' Code Action'}),
        vim.keymap.set('n', '<leader>cd', function() vim.diagnostic.open_float() end, {desc = ' Show diagnostics'}),
        },
        {
            "mason-org/mason.nvim",
            opts = {},
        },
    }
