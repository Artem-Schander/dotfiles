require "default-config"
local autocmds = require "core.autocmds"
require("settings").load_options()

local status_ok, error = pcall(vim.cmd, "luafile ~/.config/nvim/lv-config.lua")

if not status_ok then
    print "something is wrong with your lv-config"
    print(error)
end

require("settings").load_commands()
autocmds.define_augroups(lvim.autocommands)

require "keymappings"
-- require("lsp").setup_default_bindings()

local plugins = require "plugins"
local plugin_loader = require("plugin-loader").init()
plugin_loader:load { plugins, lvim.plugins }
vim.g.colors_name = lvim.colorscheme -- Colorscheme must get called after plugins are loaded or it will break new installs.
vim.cmd("colorscheme " .. lvim.colorscheme)

local commands = require "core.commands"
commands.load(commands.defaults)

local utils = require "utils"
utils.toggle_autoformat()

require("lsp").config()

local null_status_ok, null_ls = pcall(require, "null-ls")
if null_status_ok then
    null_ls.config {}
    require("lspconfig")["null-ls"].setup {}
end

local lsp_settings_status_ok, lsp_settings = pcall(require, "nlspsettings")
if lsp_settings_status_ok then
    lsp_settings.setup {
        config_home = os.getenv "HOME" .. "/.config/nvim/lsp-settings",
    }
end
