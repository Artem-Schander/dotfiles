---@type LazySpec
return {
  {
    "lukas-reineke/indent-blankline.nvim",
    opts = function(plugin, opts)
      local astro = require "astrocore"
      local is_available = astro.is_available

      if is_available "mini.indentscope" then
        local color = vim.api.nvim_get_hl_by_name("LineNr", true)
        vim.api.nvim_set_hl(0, "IblScope", color)
        vim.api.nvim_set_hl(0, "IblIndent", color)
        opts.enabled = false
      end
    end,
  },
  {
    "echasnovski/mini.indentscope",
    enabled = true,
    dependencies = {
      "AstroNvim/astrocore",
      opts = function(plugin, opts)
        -- vim.cmd "au FileType alpha,startify,dashboard,packer,lazy,NvimTree,TelescopePrompt lua vim.b.miniindentscope_disable = true"
        opts.autocmds.indentscope = {
          {
            event = "FileType",
            pattern = "alpha,startify,dashboard,packer,lazy,NvimTree,TelescopePrompt",
            desc = "Disable indentscope for certain filetypes",
            group = "indentscope",
            callback = function() vim.b.miniindentscope_disable = true end,
          },
        }
      end,
    },
    opts = function(plugin, opts)
      opts.draw = {
        -- Delay (in ms) between event and start of drawing scope indicator
        delay = 100,

        -- Animation rule for scope's first drawing. A function which, given
        -- next and total step numbers, returns wait time (in ms). See
        -- |MiniIndentscope.gen_animation| for builtin options. To disable
        -- animation, use `require('mini.indentscope').gen_animation.none()`.
        animation = function(s, n) return 2 end,
      }

      -- Which character to use for drawing scope indicator
      opts.symbol = "▏" -- ╹ ▞ ░ ╿ ║ ┃ │ ╎ ┆ ┊   ▏

      -- vim.api.nvim_command("hi MiniIndentscopeSymbol guifg=#ff0000")

      -- local statusline_hl = vim.api.nvim_get_hl_by_name("StatusLine", true)
      -- local cursorline_hl = vim.api.nvim_get_hl_by_name("CursorLine", true)
      -- local normal_hl = vim.api.nvim_get_hl_by_name("Normal", true)
      -- local colors = require("tokyonight.colors").setup({ transform = true })

      local color = vim.api.nvim_get_hl_by_name("Conceal", true) -- SpecialKey
      vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", { foreground = color.foreground })

      -- vim.api.nvim_create_autocmd("FileType", {
      --     pattern = { "startify" },
      --     -- command = "let b:miniindentscope_disable=1",
      --     command = "echo 'test'"
      -- })

      -- vim.cmd "au FileType alpha,startify,dashboard,packer,lazy,NvimTree,TelescopePrompt lua vim.b.miniindentscope_disable = true"
    end,
  },
}
