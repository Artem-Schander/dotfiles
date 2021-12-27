local M = {}
--
M.config = function()
    lvim.builtin.nvimtree = {
        active = true,
        on_config_done = nil,
        setup = {
            auto_open = 0,
            auto_close = 1,
            tab_open = 0,
            open_on_setup = false,
            ignore_ft_on_setup = {
                "startify",
                "dashboard",
                "alpha",
            },
            update_to_buf_dir = {
                enable = true,
                auto_open = true,
            },
            update_focused_file = {
                enable = 1,
                update_cwd = true,
                ignore_list = {},
            },
            system_open = {
                cmd = nil,
                args = {},
            },
            git = {
                enable = true,
                ignore = true,
                timeout = 200,
            },
            diagnostics = {
                enable = true,
                icons = {
                    hint = "",
                    info = "",
                    warning = "",
                    error = "",
                }
            },
            view = {
                width = 30,
                height = 30,
                side = "left",
                auto_resize = true,
                number = false,
                relativenumber = false,
                mappings = {
                    custom_only = false,
                    list = {},
                },
            },
            filters = {
                dotfiles = false,
                custom = { ".git", "node_modules", ".cache" },
            },
        },
        show_icons = {
            git = 1,
            folders = 1,
            files = 1,
            folder_arrows = 1,
            tree_width = 30,
        },
        quit_on_open = 0,
        git_hl = 1,
        disable_window_picker = 0,
        root_folder_modifier = ":t",
        allow_resize = 1,
        icons = {
            default = "",
            symlink = "",
            git = {
                unstaged = "",
                staged = "S",
                unmerged = "",
                renamed = "➜",
                deleted = "",
                untracked = "U",
                ignored = "◌",
            },
            folder = {
                default = "",
                open = "",
                empty = "",
                empty_open = "",
                symlink = "",
            },
        },
    }
end
--
M.setup = function()
    local status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
    if not status_ok then
        -- Log:error "Failed to load nvim-tree.config"
        return
    end
    local g = vim.g

    for opt, val in pairs(lvim.builtin.nvimtree) do
        g["nvim_tree_" .. opt] = val
    end

    -- Implicitly update nvim-tree when project module is active
    -- if lvim.builtin.project.active then
    --     lvim.builtin.nvimtree.respect_buf_cwd = 1
    --     lvim.builtin.nvimtree.setup.update_cwd = 1
    --     lvim.builtin.nvimtree.setup.disable_netrw = 0
    --     lvim.builtin.nvimtree.setup.hijack_netrw = 0
    --     vim.g.netrw_banner = 0
    -- end

    local tree_cb = nvim_tree_config.nvim_tree_callback

    if #lvim.builtin.nvimtree.setup.view.mappings.list == 0 then
        lvim.builtin.nvimtree.setup.view.mappings.list = {
            { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
            { key = "h", cb = tree_cb "close_node" },
            { key = "v", cb = tree_cb "vsplit" },
        }
    end

    lvim.builtin.which_key.mappings["e"] = { "<cmd>NvimTreeToggle<CR>", "Explorer" }

    local tree_view = require "nvim-tree.view"

    -- Add nvim_tree open callback
    local open = tree_view.open
    tree_view.open = function()
        M.on_open()
        open()
    end

    vim.cmd "au WinClosed * lua require('core.nvimtree').on_close()"

    if lvim.builtin.nvimtree.on_config_done then
        lvim.builtin.nvimtree.on_config_done(nvim_tree_config)
    end

    require("nvim-tree").setup(lvim.builtin.nvimtree.setup)
end
--
--
function M.on_open()
    if package.loaded["bufferline.state"] and lvim.builtin.nvimtree.setup.view.side == "left" then
        require("bufferline.state").set_offset(lvim.builtin.nvimtree.setup.view.width + 1, "")
    end
end

function M.on_close()
    local buf = tonumber(vim.fn.expand "<abuf>")
    local ft = vim.api.nvim_buf_get_option(buf, "filetype")
    if ft == "NvimTree" and package.loaded["bufferline.state"] then
        require("bufferline.state").set_offset(0)
    end
end

function M.change_tree_dir(dir)
    local lib_status_ok, lib = pcall(require, "nvim-tree.lib")
    if lib_status_ok then
        lib.change_dir(dir)
    end
end
--
return M
