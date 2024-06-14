---@type LazySpec
return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    { "nvim-lua/plenary.nvim", lazy = true },
    { "MunifTanjim/nui.nvim", lazy = true },
    {
      "AstroNvim/astrocore",
      opts = function(_, opts)
        local maps = opts.mappings
        -- maps.n["<Leader>e"] = { "<Cmd>Neotree toggle<CR>", desc = "Toggle Explorer" }
        maps.n["<Leader>e"] = {
          function()
            if vim.bo.filetype == "neo-tree" then
              -- vim.cmd.wincmd "p"
              vim.cmd.Neotree "close"
            else
              vim.cmd.Neotree "focus"
            end
          end,
          desc = "Toggle Explorer",
        }
        maps.n["<Leader>o"] = {}
      end,
    },
  },
  cmd = "Neotree",
  opts = function(plugin, opts)
    table.insert(opts.event_handlers, {
      event = "file_opened",
      handler = function(file_path)
        -- auto close
        -- vimc.cmd("Neotree close")
        -- OR
        require("neo-tree.command").execute { action = "close" }
      end,
    })
  end,
}
