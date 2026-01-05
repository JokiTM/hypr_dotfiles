
return {
  {
    "lervag/vimtex",
    lazy = false,  -- VimTeX darf NICHT lazy-loaded sein
    init = function()
      -- VimTeX settings (übersetzt von Vimscript → Lua)

      -- Viewer (Zathura)
      vim.g.vimtex_view_method = "zathura"

      -- Alternativer generic viewer (falls du wirklich Okular willst)
      -- vim.g.vimtex_view_general_viewer = "okular"
      -- vim.g.vimtex_view_general_options =
      --   "--unique file:@pdf\\#src:@line@tex"

      -- Compiler (Standard ist latexmk)
      -- vim.g.vimtex_compiler_method = "latexrun"

      -- Localleader ändern
      vim.g.maplocalleader = " "

      -- Syntax & Filetype werden von Neovim automatisch gesetzt,
      -- daher NICHT mit :filetype oder :syntax arbeiten.
      -- Diese Zeilen:
      --   filetype plugin indent on
      --   syntax enable
      -- entfallen in Lua völlig.
    end,
  },
}
