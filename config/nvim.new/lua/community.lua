-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  -- { import = "astrocommunity.pack.lua" },
  -- import/override with your plugins folder
  -- available plugins can be found at https://github.com/AstroNvim/astrocommunity
  { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity.colorscheme.tokyonight-nvim" },
  { import = "astrocommunity.colorscheme.tokyodark-nvim" },
  { import = "astrocommunity.colorscheme.kanagawa-nvim" },
  { import = "astrocommunity.colorscheme.kanagawa-paper-nvim" },
  { import = "astrocommunity.colorscheme.rose-pine" },
  { import = "astrocommunity.colorscheme.oldworld-nvim" },
  { import = "astrocommunity.colorscheme.onedarkpro-nvim" },

  { import = "astrocommunity.colorscheme.github-nvim-theme" },

  { import = "astrocommunity.completion.copilot-cmp" },
}
