return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup({
      extensions = { 'nvim-tree', 'mason', 'lazy' },
      options = {
        icons_enabled = true,
        theme = "auto",
      },
      sections = {
        lualine_a = {
          {
            "filename",
            path = 1,
          },
        },
        lualine_x = {
          {
            require("noice").api.statusline.mode.get,
            cond = require("noice").api.statusline.mode.has,
            color = { fg = "#ff9e64" },
          }
        },
      },
    })
  end,
}
