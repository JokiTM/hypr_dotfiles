return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",

    opts = {
      -- optional
      -- hidden = { "<Plug>" },
    },

    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },

    config = function(_, opts)
      local wk = require("which-key")
      wk.setup(opts)

      wk.add({
        -- Group
        { "<leader>l", group = "latex" },

        -- Compile
        { "<leader>ll", desc = "Compile" },
        { "<leader>lL", desc = "Compile selected" },
        { "<leader>lk", desc = "Stop" },
        { "<leader>lK", desc = "Stop all" },

        -- Cleaning
        { "<leader>lc", desc = "Clean" },
        { "<leader>lC", desc = "Clean all" },

        -- View / TOC
        { "<leader>lv", desc = "View PDF" },
        { "<leader>lt", desc = "TOC" },
        { "<leader>lT", desc = "Toggle TOC" },

        -- Logs / Errors
        { "<leader>le", desc = "Errors" },
        { "<leader>lo", desc = "Compile output" },
        { "<leader>lq", desc = "Log" },

        -- State / Info
        { "<leader>lg", desc = "Status" },
        { "<leader>lG", desc = "Status (all)" },
        { "<leader>li", desc = "Info" },
        { "<leader>lI", desc = "Info (full)" },

        -- Reload / Main
        { "<leader>lr", desc = "Reload" },
        { "<leader>lR", desc = "Reload state" },
        { "<leader>ls", desc = "Toggle main file" },

        -- Misc
        { "<leader>lm", desc = "Imaps list" },
        { "<leader>la", desc = "Context menu" },
        { "<leader>lS", desc = "Compile SS" },
      })
    end,
  },
}
