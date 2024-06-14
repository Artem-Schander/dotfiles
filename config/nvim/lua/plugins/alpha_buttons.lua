---@type LazySpec
return {
  "goolord/alpha-nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = function(_, opts) -- override the options using lazy.nvim
    local uv = vim.uv or vim.loop
    local get_icon = require("astroui").get_icon
    local is_windows = uv.os_uname().version:match "Windows"
    local sep = is_windows and "\\" or "/"

    local session_file = vim.fn.stdpath "data"
      .. sep
      .. "dirsession"
      .. sep
      .. vim.fn.getcwd():gsub("/", "_")
      .. ".json"

    -- vim.notify(session_file)

    --- @param shortcut string Shortcut string of a button mapping
    --- @param desc string Real text description of the mapping
    --- @param rhs string? Righthand side of mapping if defining a new mapping (_optional_)
    --- @param map_opts table? `keymap.set` options used during keymap creating (_optional_)
    opts.button = function(shortcut, desc, rhs, map_opts)
      -- HACK: fixes leader customization, remove after fixed upstream
      -- https://github.com/goolord/alpha-nvim/pull/271
      local lhs = shortcut:gsub("%s", ""):gsub(opts.leader, "<Leader>")
      local default_map_opts = { noremap = true, silent = true, nowait = true, desc = desc }

      local leader = vim.g.mapleader
      if leader == " " then leader = "SPC" end

      return {
        type = "button",
        val = desc,
        on_press = function()
          vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(rhs or lhs .. "<Ignore>", true, false, true), "t", false)
        end,
        opts = {
          position = "center",
          shortcut = shortcut:gsub(opts.leader, leader),
          cursor = -2,
          width = 36,
          shrink_margin = true,
          align_shortcut = "right",
          hl = "DashboardCenter",
          hl_shortcut = "DashboardShortcut",
          keymap = rhs and { "n", lhs, rhs, require("astrocore").extend_tbl(default_map_opts, map_opts) },
        },
      }
    end

    local buttons = {
      -- opts.button(
      --   "LDR s  ",
      --   get_icon("Refresh", 2, true) .. "Load Session",
      --   -- ":SessionManager load_current_dir_session<CR>"
      --   ":lua require('resession').load(vim.fn.getcwd():gsub('/', '_'), { dir = 'dirsession', silence_errors = true })<CR>"
      -- ),
      opts.button("LDR n  ", get_icon("FileNew", 2, true) .. "New File  "),
      opts.button("LDR f f", get_icon("Search", 2, true) .. "Find File  "),
      opts.button("LDR f o", get_icon("DefaultFile", 2, true) .. "Recents  "),
      opts.button("LDR f w", get_icon("WordFile", 2, true) .. "Find Word  "),
      opts.button("LDR f '", get_icon("Bookmarks", 2, true) .. "Bookmarks  "),
      -- opts.button("LDR S l", get_icon("Refresh", 2, true) .. "Last Session  "),
    }

    -- local list = require("resession").list()
    -- if list[0] ~= nil then vim.notify(list[0]) end
    -- -- if next(list) ~= nil then vim.notify(list[0]) end

    if vim.fn.getcwd() then
      local exists = require("resession.files").exists(session_file)
      if exists then
        buttons = {
          opts.button(
            "LDR s  ",
            get_icon("Refresh", 2, true) .. "Load Session",
            -- ":SessionManager load_current_dir_session<CR>"
            ":lua require('resession').load(vim.fn.getcwd():gsub('"
              .. sep
              .. "', '_'), { dir = 'dirsession' })<CR>"
          ),
          unpack(buttons),
        }
      end
    end

    opts.section.buttons.val = buttons
  end,
}
