local M = {}

M.config = function()
    local status_ok, telescope = pcall(require, "telescope")
    if not status_ok then
        return
    end
    local actions = require "telescope.actions"
    -- if Globals.plugin.trouble.active then
    --     local trouble = require("trouble.providers.telescope")
    -- end
    -- Global remapping
    ------------------------------
    -- '--color=never',
    telescope.setup {
        defaults = {
            find_command = {
                -- "rg",
                -- "--no-heading",
                -- "--with-filename",
                -- "--line-number",
                -- "--column",
                -- "--smart-case",
                'ag',
                '--filename',
                '--noheading',
                '--nogroup',
                '--column',
                '--color',
                '--color-line-number',
                '--smart-case',
            },
            prompt_prefix = "> ",
            selection_caret = "> ",
            entry_prefix = "  ",
            initial_mode = "insert",
            selection_strategy = "reset",
            sorting_strategy = "descending",
            layout_strategy = "horizontal",
            layout_config = {
                width = 0.75,
                prompt_position = "bottom",
                preview_cutoff = 120,
                horizontal = { mirror = false },
                vertical = { mirror = false },
            },
            file_sorter = require("telescope.sorters").get_fzf_sorter,
            file_ignore_patterns = {},
            generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
            -- path_display = true,
            -- shorten_path = true,
            winblend = 0,
            border = {},
            borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
            color_devicons = true,
            use_less = true,
            set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
            file_previewer = require("telescope.previewers").vim_buffer_cat.new,
            grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
            qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,

            -- Developer configurations: Not meant for general override
            buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
            mappings = {
                i = {
                    ["<C-c>"] = actions.close,
                    ["<C-j>"] = actions.move_selection_next,
                    ["<C-k>"] = actions.move_selection_previous,
                    -- ["<c-t>"] = trouble.open_with_trouble,
                    ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
                    -- To disable a keymap, put [map] = false
                    -- So, to not map "<C-n>", just put
                    -- ["<c-x>"] = false,
                    -- ["<esc>"] = actions.close,

                    -- Otherwise, just set the mapping to the function that you want it to be.
                    -- ["<C-i>"] = actions.select_horizontal,

                    -- Add up multiple actions
                    ["<CR>"] = actions.select_default + actions.center,

                    -- You can perform as many actions in a row as you like
                    -- ["<CR>"] = actions.select_default + actions.center + my_cool_custom_action,
                },
                n = {
                    ["<C-j>"] = actions.move_selection_next,
                    ["<C-k>"] = actions.move_selection_previous,
                    -- ["<c-t>"] = trouble.open_with_trouble,
                    ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
                    -- ["<C-i>"] = my_cool_custom_action,
                },
            },
        },
        extensions = {
            -- fzy_native = {
            --     override_generic_sorter = false,
            --     override_file_sorter = true,
            -- },
            fzf = {
                override_generic_sorter = true, -- override the generic sorter
                override_file_sorter = true,     -- override the file sorter
                case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                -- the default case_mode is "smart_case"
            }
        },
    }

    -- require'telescope'.load_extension('project')
    require('telescope').load_extension('fzf')
end

return M

-- local actions = require('telescope.actions')
-- -- Global remapping
-- ------------------------------
-- -- '--color=never',
-- require('telescope').setup {
--     defaults = {
--         find_command = {
--             -- 'rg',
--             -- '--no-heading',
--             -- '--with-filename',
--             -- '--line-number',
--             -- '--column',
--             -- '--smart-case'
--             'ag',
--             '--filename',
--             '--noheading',
--             '--nogroup',
--             '--column',
--             '--color',
--             '--color-line-number',
--             '--smart-case'
--         },
--         prompt_prefix = "> ",
--         selection_caret = "> ",
--         entry_prefix = "  ",
--         initial_mode = "insert",
--         selection_strategy = "reset",
--         sorting_strategy = "descending",
--         layout_strategy = "flex",
--         winblend = 5,
--         layout_config = {
--             width = 0.75,
--             prompt_position = "bottom",
--             preview_cutoff = 120,
--             horizontal = {
--                 -- width_padding = 0.1,
--                 -- height_padding = 0.1,
--                 preview_width = 0.6,
--                 mirror = false,
--             },
--             vertical = {
--                 -- width_padding = 0.05,
--                 -- height_padding = 1,
--                 preview_height = 0.5,
--                 mirror = false,
--             }
--         },
--         file_sorter = require'telescope.sorters'.get_fuzzy_file,
--         file_ignore_patterns = {},
--         generic_sorter = require'telescope.sorters'.get_generic_fuzzy_sorter,
--         shorten_path = true,
--         -- width = 0.75,
--         -- results_height = 1,
--         -- results_width = 0.8,
--         -- preview_width = 0.8,
--         border = {},
--         borderchars = {'─', '│', '─', '│', '╭', '╮', '╯', '╰'},
--         color_devicons = true,
--         use_less = true,
--         set_env = {['COLORTERM'] = 'truecolor'}, -- default = nil,
--         file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
--         grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
--         qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

--         -- Developer configurations: Not meant for general override
--         buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker,
--         mappings = {
--             i = {
--                 ["<C-j>"] = actions.move_selection_next,
--                 ["<C-k>"] = actions.move_selection_previous,
--                 ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
--                 -- To disable a keymap, put [map] = false
--                 -- So, to not map "<C-n>", just put
--                 -- ["<c-x>"] = false,
--                 ["<esc>"] = actions.close,

--                 -- Otherwise, just set the mapping to the function that you want it to be.
--                 -- ["<C-i>"] = actions.select_horizontal,

--                 -- Add up multiple actions
--                 ["<CR>"] = actions.select_default + actions.center

--                 -- You can perform as many actions in a row as you like
--                 -- ["<CR>"] = actions.select_default + actions.center + my_cool_custom_action,
--             },
--             n = {
--                 ["<C-j>"] = actions.move_selection_next,
--                 ["<C-k>"] = actions.move_selection_previous,
--                 ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
--                 -- ["<C-i>"] = my_cool_custom_action,
--             }
--         }
--     },
--     extensions = {
--         fzf = {
--             override_generic_sorter = true, -- override the generic sorter
--             override_file_sorter = true,     -- override the file sorter
--             case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
--             -- the default case_mode is "smart_case"
--         }
--     }
-- }

-- -- To get fzf loaded and working with telescope, you need to call
-- -- load_extension, somewhere after setup function:
-- require('telescope').load_extension('fzf')
