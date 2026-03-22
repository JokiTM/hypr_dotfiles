 return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    -- disable netrw at the very start of your init.lua
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    
    -- optionally enable 24-bit colour
    vim.opt.termguicolors = true
    local api = require "nvim-tree.api"

     require("nvim-tree").setup {
       on_attach = function(bufnr)
         local api = require("nvim-tree.api")

         local function opts(desc)
           return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
         end

         api.config.mappings.default_on_attach(bufnr)

         vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))
         vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close Directory"))
       end,
     }
     vim.keymap.set("n", "<leader>E", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
     vim.keymap.set("n", "<leader>e", function()
       local file_dir = vim.fn.expand("%:p:h")
       api.tree.toggle({ path = file_dir, update_cwd = true })
     end, { desc = "Toggle file explorer(Root Dir)" })
   end,
 }
