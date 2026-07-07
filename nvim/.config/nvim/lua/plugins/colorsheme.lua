return {
  --  { "ellisonleao/gruvbox.nvim", priority = 1000, config = true, name = "gruvbox" },
  { "rebelot/kanagawa.nvim", name = "kanagawa" },
  --  { "catppuccin/nvim", name = "catppuccin", lazy = false },
  { "rose-pine/neovim", name = "rose-pine" },
  { "sainnhe/everforest" },
  { "bluz71/vim-nightfly-colors" },
  { "NLKNguyen/papercolor-theme" },
  { "romainl/Apprentice" },
  { "oonamo/ef-themes.nvim" },

  -- TokyoNight
  {
    "folke/tokyonight.nvim",
    lazy = true,
    name = "tokyonight",
    priority = 1000,
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },

  -- Gruvbox
  {
    "ellisonleao/gruvbox.nvim",
    lazy = true,
    name = "gruvbox",
    priority = 1000,
    opts = {
      transparent_mode = true,
    },
  },

  -- Catppuccin
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    priority = 1000,
    opts = {
      transparent_background = true,
      -- optional (if you also want floating windows transparent)
      float = { transparent = true, solid = false },
    },
  },

  -- Configure LazyVim to load colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },
}
