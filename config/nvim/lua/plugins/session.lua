-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

local utils = require("user.utils")

---@type LazySpec
return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      sessions = {
        -- disable the auto-saving of directory sessions
        autosave = { cwd = false },
      },
      mappings = {
        n = {
          -- update save dirsession mapping to get the correct session name
          ["<Leader>SS"] = {
            function()
              require("resession").save(
                utils.get_session_name(),
                { dir = "dirsession" }
              )
            end,
            desc = "Save this dirsession",
          },
          -- update load dirsession mapping to get the correct session name
          ["<Leader>S."] = {
            function()
              require("resession").load(
                utils.get_session_name(),
                { dir = "dirsession" }
              )
            end,
            desc = "Load current dirsession",
          },
        },
      },
      autocmds = {
        git_branch_sessions = {
          -- auto save directory sessions on leaving
          {
            event = "VimLeavePre",
            desc = "Save git branch directory sessions on close",
            callback = vim.schedule_wrap(function()
              if require("astrocore.buffer").is_valid_session() then
                require("resession").save(
                  utils.get_session_name(),
                  { dir = "dirsession", notify = false }
                )
              end
            end),
          },
          -- auto restore previous previous directory session, remove if necessary
          -- {
          --   event = "VimEnter",
          --   desc = "Restore previous directory session if neovim opened with no arguments",
          --   nested = true, -- trigger other autocommands as buffers open
          --   callback = function()
          --     -- Only load the session if nvim was started with no args
          --     if vim.fn.argc(-1) == 0 then
          --       -- try to load a directory session using the current working directory
          --       require("resession").load(
          --         utils.get_session_name(),
          --         { dir = "dirsession", silence_errors = true }
          --       )
          --     end
          --   end,
          -- },
        },
      },
    },
  },
  {
    -- "AstroNvim/astrodashboard",
    -- opts = function(_, opts)
    --   local resession = require("resession")
    --   local cwd = vim.fn.getcwd()
    --   local session_exists = resession.session_file(cwd, { dir = "dirsession" }) and vim.fn.filereadable(resession.session_file(cwd, { dir = "dirsession" })) == 1
    --
    --   -- Remove the default "Last Session" button
    --   opts.buttons = vim.tbl_filter(function(btn)
    --     return btn.id ~= "last_session"
    --   end, opts.buttons or {})
    --
    --   -- Add "Project Session" button if session exists
    --   if session_exists then
    --     table.insert(opts.buttons, 1, {
    --       id = "project_session",
    --       icon = " ",
    --       desc = "Load Project Session",
    --       action = function()
    --         resession.load(cwd, { dir = "dirsession" })
    --       end,
    --     })
    --   end
    --
    --   return opts
    -- end,
  }
}
