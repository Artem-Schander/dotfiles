local utils = {}

-- recursive Print (structure, limit, separator)
local function r_inspect_settings(structure, limit, separator)
    limit = limit or 100 -- default item limit
    separator = separator or "." -- indent string
    if limit < 1 then
        print "ERROR: Item limit reached."
        return limit - 1
    end
    if structure == nil then
        io.write("-- O", separator:sub(2), " = nil\n")
        return limit - 1
    end
    local ts = type(structure)

    if ts == "table" then
        for k, v in pairs(structure) do
            -- replace non alpha keys with ["key"]
            if tostring(k):match "[^%a_]" then
                k = '["' .. tostring(k) .. '"]'
            end
            limit = r_inspect_settings(v, limit, separator .. "." .. tostring(k))
            if limit < 0 then
                break
            end
        end
        return limit
    end

    if ts == "string" then
        -- escape sequences
        structure = string.format("%q", structure)
    end
    separator = separator:gsub("%.%[", "%[")
    if type(structure) == "function" then
        -- don't print functions
        io.write("-- lvim", separator:sub(2), " = function ()\n")
    else
        io.write("lvim", separator:sub(2), " = ", tostring(structure), "\n")
    end
    return limit - 1
end

function utils.generate_settings()
    -- Opens a file in append mode
    local file = io.open("lv-settings.lua", "w")

    -- sets the default output file as test.lua
    io.output(file)

    -- write all `lvim` related settings to `lv-settings.lua` file
    r_inspect_settings(lvim, 10000, ".")

    -- closes the open file
    io.close(file)
end

function utils.unrequire(m)
    package.loaded[m] = nil
    _G[m] = nil
end

function utils.gsub_args(args)
    if args == nil or type(args) ~= "table" then
        return args
    end
    local buffer_filepath = vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))
    for i = 1, #args do
        args[i] = string.gsub(args[i], "${FILEPATH}", buffer_filepath)
    end
    return args
end

-- autoformat
function utils.toggle_autoformat()
    if lvim.format_on_save then
        require("core.autocmds").define_augroups {
            autoformat = {
                {
                    "BufWritePre",
                    "*",
                    ":silent lua vim.lsp.buf.formatting_sync()",
                },
            },
        }
    end

    if not lvim.format_on_save then
        vim.cmd [[
        if exists('#autoformat#BufWritePre')
            :autocmd! autoformat
        endif
        ]]
    end
end

function utils.reload_lv_config()
    vim.cmd "source ~/.config/nvim/lua/settings.lua"
    vim.cmd "source ~/.config/nvim/lv-config.lua"
    vim.cmd "source ~/.config/nvim/lua/plugins.lua"
    local plugins = require "plugins"
    local plugin_loader = require("plugin-loader").init()
    utils.toggle_autoformat()
    plugin_loader:load { plugins, lvim.plugins }
    vim.cmd ":PackerCompile"
    vim.cmd ":PackerInstall"
    -- vim.cmd ":PackerClean"
end

function utils.check_lsp_client_active(name)
    local clients = vim.lsp.get_active_clients()
    for _, client in pairs(clients) do
        if client.name == name then
            return true
        end
    end
    return false
end

function utils.is_table(t)
    return type(t) == "table"
end

function utils.is_string(t)
    return type(t) == "string"
end

function utils.has_value(tab, val)
    for _, value in ipairs(tab) do
        if value == val then
            return true
        end
    end

    return false
end

function utils.add_keymap(mode, opts, keymaps)
    for _, keymap in ipairs(keymaps) do
        vim.api.nvim_set_keymap(mode, keymap[1], keymap[2], opts)
    end
end

function utils.add_keymap_normal_mode(opts, keymaps)
    utils.add_keymap("n", opts, keymaps)
end

function utils.add_keymap_visual_mode(opts, keymaps)
    utils.add_keymap("v", opts, keymaps)
end

function utils.add_keymap_visual_block_mode(opts, keymaps)
    utils.add_keymap("x", opts, keymaps)
end

function utils.add_keymap_insert_mode(opts, keymaps)
    utils.add_keymap("i", opts, keymaps)
end

function utils.add_keymap_term_mode(opts, keymaps)
    utils.add_keymap("t", opts, keymaps)
end

return utils

-- TODO: find a new home for these autocommands
