-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

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
        maps.n["<Leader>o"] = nil
      end,
    },
  },
  cmd = "Neotree",
  -- init = function()
  --   vim.api.nvim_create_autocmd('BufNewFile', {
  --     group = vim.api.nvim_create_augroup('RemoteFile', {clear = true}),
  --     callback = function()
  --       local f = vim.fn.expand('%:p')
  --       for _, v in ipairs{'sftp', 'scp', 'ssh', 'dav', 'fetch', 'ftp', 'http', 'rcp', 'rsync'} do
  --         local p = v .. '://'
  --         if string.sub(f, 1, #p) == p then
  --           -- vim.cmd[[
  --           --   unlet g:loaded_netrw
  --           --   unlet g:loaded_netrwPlugin
  --           --   runtime! plugin/netrwPlugin.vim
  --           --   silent Explore %
  --           -- ]]
  --
  --           vim.g.loaded_netrw = 0
  --           vim.g.loaded_netrwPlugin = 0
  --           -- vim.cmd("runtime! plugin/netrw.vim")
  --           vim.cmd("runtime! plugin/netrwPlugin.vim")
  --           -- vim.cmd("silent Explore %")
  --
  --           vim.api.nvim_clear_autocmds{group = 'RemoteFile'}
  --           break
  --         end
  --       end
  --     end
  --   })
  -- end,
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
