-----------------------------------------
------------------ LSP ------------------
-----------------------------------------

vim.pack.add({
    { src = 'https://github.com/neovim/nvim-lspconfig' },
    { src = 'https://github.com/mason-org/mason.nvim' },
    { src = 'https://github.com/nvim-treesitter/nvim-treesitter' },
})

require('nvim-treesitter').install { 'rust', 'javascript', 'zig', 'toml' }
require("mason").setup({
})

vim.lsp.config('lua_ls', {
    on_init = function(client)
        if client.workspace_folders then
            local path = client.workspace_folders[1].name
            if
                path ~= vim.fn.stdpath('config')
                and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc'))
                then
                    return
                end
            end

            client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
                runtime = {
                    -- Tell the language server which version of Lua you're using (most
                    -- likely LuaJIT in the case of Neovim)
                    version = 'LuaJIT',
                    -- Tell the language server how to find Lua modules same way as Neovim
                    -- (see `:h lua-module-load`)
                    path = {
                        'lua/?.lua',
                        'lua/?/init.lua',
                    },
                },
                -- Make the server aware of Neovim runtime files
                workspace = {
                    checkThirdParty = false,
                    library = {
                        vim.env.VIMRUNTIME,
                        -- For LSP Settings Type Annotations: https://github.com/neovim/nvim-lspconfig#lsp-settings-type-annotations
                        vim.api.nvim_get_runtime_file("lua/lspconfig", false)[1],
                        -- Hyprland autocompletion
                        "/usr/share/hypr/stubs",
                    },
                    -- Or pull in all of 'runtimepath'.
                    -- NOTE: this is a lot slower and will cause issues when working on
                    -- your own configuration.
                    -- See https://github.com/neovim/nvim-lspconfig/issues/3189
                    -- library = vim.api.nvim_get_runtime_file('', true),
                },
            })
        end,
        settings = {
            Lua = {},
        },
    })

  vim.lsp.config('rust_analyzer', {
    settings = {
      ['rust-analyzer'] = {
        diagnostics = {
          enable = true;
        }
      }
    }
  })

vim.lsp.enable({ 'lua_ls', 'clangd', 'rust_analyzer' })
