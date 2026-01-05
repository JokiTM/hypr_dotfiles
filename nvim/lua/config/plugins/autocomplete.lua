return {
  -- Autocomplete
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp", -- LSP-Quelle
      "hrsh7th/cmp-buffer",   -- Buffer-Quelle
      "hrsh7th/cmp-path",     -- Dateipfade
      "hrsh7th/cmp-cmdline",  -- Commandline
      "L3MON4D3/LuaSnip",     -- Snippet Engine
      "saadparwaiz1/cmp_luasnip" -- Snippet-Quelle
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        }),
      })
    end
  },

  -- LSP mit Keymaps für Code Actions
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- on_attach für Keymaps
      local on_attach = function(_, bufnr) 
        local opts = { noremap=true, silent=true, buffer=bufnr }

        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action,
          vim.tbl_extend("force", opts, { desc = "LSP: Code Action" }))

        vim.keymap.set('n', '<leader>cr', vim.lsp.buf.rename,
          vim.tbl_extend("force", opts, { desc = "LSP: Rename Symbol" }))

        vim.keymap.set('n', '<leader>cf', function()
          vim.lsp.buf.format({ async = true })
        end, vim.tbl_extend("force", opts, { desc = "LSP: Format Buffer" }))

        vim.keymap.set('n', '<leader>c', function() end,
          { desc = "+Code", buffer = bufnr })
      end
      -- Beispiel: Lua LSP
      vim.lsp.config("lua_ls", {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            diagnostics = { globals = { "vim", "require" } },
          },
        },
      })

      -- Beispiel: Python LSP
      vim.lsp.config("pyright", {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          python = {
            analysis = {
              autoSearchPaths = true,
              diagnosticMode = "openFilesOnly",
              typeCheckingMode = "basic",
              useLibraryCodeForTypes = true,
            },
          },
        },
      })
    end
  }
}
