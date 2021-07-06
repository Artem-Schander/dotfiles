local M = {}

M.config = function()
    local gl = require('galaxyline')
    -- get my theme in galaxyline repo
    -- local colors = require('galaxyline.theme').default

    local condition = require('galaxyline.condition')
    local gls = gl.section
    gl.short_line_list = {'NvimTree', 'vista', 'dbui', 'packer', 'startify'}

    table.insert(gls.left, {
        ViMode = {
            provider = function()
                -- auto change color according the vim mode
                local mode_color = {
                    n = Globals.colors.blue,
                    i = Globals.colors.green,
                    v = Globals.colors.purple,
                    [''] = Globals.colors.purple,
                    V = Globals.colors.purple,
                    c = Globals.colors.magenta,
                    no = Globals.colors.blue,
                    s = Globals.colors.yellow,
                    S = Globals.colors.orange,
                    [''] = Globals.colors.orange,
                    ic = Globals.colors.yellow,
                    R = Globals.colors.red,
                    Rv = Globals.colors.red,
                    cv = Globals.colors.blue,
                    ce = Globals.colors.blue,
                    r = Globals.colors.cyan,
                    rm = Globals.colors.cyan,
                    ['r?'] = Globals.colors.cyan,
                    ['!'] = Globals.colors.blue,
                    t = Globals.colors.blue
                }
                vim.api.nvim_command("hi GalaxyViMode guifg=" .. mode_color[vim.fn.mode()])
                return "▊"
            end,
            highlight = 'StatusLineNC'
            -- highlight = {colors.red, colors.bg}
        },
    })

    -- print(vim.fn.getbufvar(0, 'ts'))
    vim.fn.getbufvar(0, "ts")

    table.insert(gls.left, {
        GitIcon = {
            provider = function()
                return "  "
            end,
            condition = condition.check_git_workspace,
            separator = " ",
            -- separator_highlight = "StatusLineSeparator",
            -- highlight = "StatusLineGit",
            separator_highlight = {'NONE', Globals.colors.bg},
            highlight = {Globals.colors.orange, Globals.colors.bg}
        },
    })

    table.insert(gls.left, {
        GitBranch = {
            provider = "GitBranch",
            condition = condition.check_git_workspace,
            separator = " ",
            -- separator_highlight = "StatusLineSeparator",
            -- highlight = "StatusLineNC",
            separator_highlight = {'NONE', Globals.colors.bg},
            highlight = {Globals.colors.gray, Globals.colors.bg}
        },
    })

    table.insert(gls.left, {
        DiffAdd = {
            provider = "DiffAdd",
            condition = condition.hide_in_width,
            icon = "  ",
            -- highlight = "StatusLineGitAdd",
            highlight = {Globals.colors.green, Globals.colors.bg}
        },
    })

    table.insert(gls.left, {
        DiffModified = {
            provider = "DiffModified",
            condition = condition.hide_in_width,
            icon = " 柳",
            -- highlight = "StatusLineGitChange",
            highlight = {Globals.colors.blue, Globals.colors.bg}
        },
    })

    table.insert(gls.left, {
        DiffRemove = {
            provider = "DiffRemove",
            condition = condition.hide_in_width,
            icon = "  ",
            -- highlight = "StatusLineGitDelete",
            highlight = {Globals.colors.red, Globals.colors.bg}
        },
    })

    -- table.insert(gls.left, {
    --     RelativePath = {
    --         provider = function()
    --             local path = vim.fn.fnamemodify(vim.fn.expand '%:p:h', ':~:.')
    --             local file = vim.fn.fnamemodify(vim.fn.expand '%:t', ':~:.')
    --             if vim.fn.empty(file) == 1 then return '' end
    --             if vim.bo.filetype == 'startify' then return '' end
    --             vim.api.nvim_command('hi GalaxyRelativePath guifg=' .. mode_color[vim.fn.mode()])
    --             return path .. '/'
    --         end
    --     }
    -- })

    table.insert(gls.left, {
        FileName = {
            provider = function(modified_icon, readonly_icon)
                local file = vim.fn.fnamemodify(vim.fn.expand '%', ':~:.')
                -- local file = vim.fn.fnamemodify(vim.fn.expand '%:t', ':~:.')
                if vim.fn.empty(file) == 1 then return '' end
                if vim.bo.filetype == 'startify' then return '' end

                modified_icon = modified_icon or ''
                readonly_icon = readonly_icon or ''

                local readonly = vim.bo.readonly
                if vim.bo.filetype == 'help' then
                    readonly = false
                end

                if readonly then
                    file = readonly_icon .. ' ' .. file
                end

                -- local is_modified = vim.api.nvim_buf_get_option(vim.fn.bufnr, 'modified')
                if vim.bo.modifiable and vim.bo.modified then
                    file = file .. ' ' .. modified_icon
                    vim.api.nvim_command('hi GalaxyFileName guifg=' .. Globals.colors.yellow)
                else
                    vim.api.nvim_command('hi GalaxyFileName guifg=' .. Globals.colors.white)
                end

                return file .. ' '
            end,
            condition = condition.hide_in_width,
            icon = ' @ ',
            highlight = {Globals.colors.white, Globals.colors.bg}
        }
    })

    -------------------------

    table.insert(gls.right, {
        DiagnosticError = {
            provider = "DiagnosticError",
            icon = "  ",
            -- highlight = "StatusLineLspDiagnosticsError",
            highlight = {Globals.colors.red, Globals.colors.bg}
        },
    })

    table.insert(gls.right, {
        DiagnosticWarn = {
            provider = "DiagnosticWarn",
            icon = "  ",

            -- highlight = "StatusLineLspDiagnosticsWarning",
            highlight = {Globals.colors.orange, Globals.colors.bg}
        },
    })

    table.insert(gls.right, {
        DiagnosticInfo = {
            provider = "DiagnosticInfo",
            icon = "  ",

            -- highlight = "StatusLineLspDiagnosticsInformation",
            highlight = {Globals.colors.yellow, Globals.colors.bg}
        },
    })

    table.insert(gls.right, {
        DiagnosticHint = {
            provider = "DiagnosticHint",
            icon = "  ",

            -- highlight = "StatusLineLspDiagnosticsHint",
            highlight = {Globals.colors.blue, Globals.colors.bg}
        },
    })

    table.insert(gls.right, {
        TreesitterIcon = {
            provider = function()
                if next(vim.treesitter.highlighter.active) ~= nil then
                    return "  "
                end
                return ""
            end,
            separator = " ",
            separator_highlight = "StatusLineSeparator",
            highlight = "StatusLineTreeSitter",
        },
    })

    local get_lsp_client = function(msg)
        msg = msg or "No Active LSP Client"
        local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
        local clients = vim.lsp.get_active_clients()
        if next(clients) == nil then
            return msg
        end
        local lsps = ""
        for _, client in ipairs(clients) do
            local filetypes = client.config.filetypes
            if filetypes and vim.fn.index(filetypes, buf_ft) ~= 1 then
                -- print(client.name)
                if lsps == "" then
                    -- print("first", lsps)
                    lsps = client.name
                else
                    lsps = lsps .. ", " .. client.name
                    -- print("more", lsps)
                end
            end
        end
        if lsps == "" then
            return msg
        else
            return lsps
        end
    end

    table.insert(gls.right, {
        ShowLspClient = {
            provider = get_lsp_client,
            condition = function()
                local tbl = { ["dashboard"] = true, [" "] = true }
                if tbl[vim.bo.filetype] then
                    return false
                end
                return true
            end,
            icon = "  ",
            -- highlight = "StatusLineNC",
            highlight = {Globals.colors.gray, Globals.colors.bg}
        },
    })

    table.insert(gls.right, {
        LineInfo = {
            provider = "LineColumn",
            separator = "  ",
            separator_highlight = "StatusLineSeparator",
            -- highlight = "StatusLineNC",
            highlight = {Globals.colors.gray, Globals.colors.bg}
        },
    })

    table.insert(gls.right, {
        PerCent = {
            provider = "LinePercent",
            separator = " ",
            separator_highlight = "StatusLineSeparator",
            -- highlight = "StatusLineNC",
            highlight = {Globals.colors.gray, Globals.colors.bg}
        },
    })

    -- table.insert(gls.right, {
    --     Tabstop = {
    --         provider = function()
    --             return "Spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth") .. " "
    --         end,
    --         condition = condition.hide_in_width,
    --         separator = " ",
    --         separator_highlight = "StatusLineSeparator",
    --         highlight = "StatusLineNC",
    --     },
    -- })

    table.insert(gls.right, {
        Tabstop = {
            provider = function()
                -- check for mixed indent
                local tabs = vim.fn.search('^\t', 'nw')
                local spaces = vim.fn.search('^ ', 'nw')

                local type = 'Spaces'
                if tabs ~= 0 and spaces ~= 0 then
                    type = 'Mixed'
                elseif vim.bo.expandtab ~= true then
                    type = 'Tabs'
                end
                return type .. ': ' .. vim.api.nvim_buf_get_option(0, 'shiftwidth') .. ' '
            end,
            condition = condition.hide_in_width,
            separator = ' ',
            -- separator_highlight = "StatusLineSeparator",
            -- highlight = "StatusLineNC",
            separator_highlight = {'NONE', Globals.colors.bg},
            highlight = {Globals.colors.gray, Globals.colors.bg}
        }
    })

    table.insert(gls.right, {
        BufferType = {
            provider = "FileTypeName",
            condition = condition.hide_in_width,
            separator = " ",
            -- separator_highlight = "StatusLineSeparator",
            -- highlight = "StatusLineNC",
            separator_highlight = {'NONE', Globals.colors.bg},
            highlight = {Globals.colors.gray, Globals.colors.bg}
        },
    })

    table.insert(gls.right, {
        FileEncode = {
            provider = "FileEncode",
            condition = condition.hide_in_width,
            separator = " ",
            -- separator_highlight = "StatusLineSeparator",
            -- highlight = "StatusLineNC",
            separator_highlight = {'NONE', Globals.colors.bg},
            highlight = {Globals.colors.gray, Globals.colors.bg}
        },
    })

    table.insert(gls.right, {
        Space = {
            provider = function()
                return " "
            end,
            separator = " ",
            -- separator_highlight = "StatusLineSeparator",
            -- highlight = "StatusLineNC",
            separator_highlight = {'NONE', Globals.colors.bg},
            highlight = {Globals.colors.orange, Globals.colors.bg}
        },
    })

    table.insert(gls.short_line_left, {
        BufferType = {
            provider = "FileTypeName",
            separator = " ",
            -- separator_highlight = "StatusLineSeparator",
            -- highlight = "StatusLineNC",
            separator_highlight = {'NONE', Globals.colors.bg},
            highlight = {Globals.colors.gray, Globals.colors.bg}
        },
    })

    table.insert(gls.short_line_left, {
        SFileName = {
            provider = "SFileName",
            condition = condition.buffer_not_empty,

            -- highlight = "StatusLineNC",
            highlight = {Globals.colors.gray, Globals.colors.bg}
        },
    })

--     gls.left[1] = {
--         ViMode = {
--             provider = function()
--                 -- auto change color according the vim mode
--                 vim.api.nvim_command('hi GalaxyViMode guifg=' .. mode_color[vim.fn.mode()])
--                 return '▊ '
--             end,
--             highlight = {Globals.colors.red, Globals.colors.bg}
--         }
--     }
--     print(vim.fn.getbufvar(0, 'ts'))
--     vim.fn.getbufvar(0, 'ts')

--     gls.left[2] = {
--         GitIcon = {
--             provider = function()
--                 return ' '
--             end,
--             condition = condition.check_git_workspace,
--             separator = ' ',
--             separator_highlight = {'NONE', Globals.colors.bg},
--             highlight = {Globals.colors.orange, Globals.colors.bg}
--         }
--     }

--     gls.left[3] = {
--         GitBranch = {
--             provider = 'GitBranch',
--             condition = condition.check_git_workspace,
--             separator = ' ',
--             separator_highlight = {'NONE', Globals.colors.bg},
--             highlight = {Globals.colors.gray, Globals.colors.bg}
--         }
--     }

--     gls.left[4] = {
--         DiffAdd = {
--             provider = 'DiffAdd',
--             condition = condition.hide_in_width,
--             icon = '  ',
--             highlight = {Globals.colors.green, Globals.colors.bg}
--         }
--     }
--     gls.left[5] = {
--         DiffModified = {
--             provider = 'DiffModified',
--             condition = condition.hide_in_width,
--             icon = ' 柳',
--             highlight = {Globals.colors.blue, Globals.colors.bg}
--         }
--     }
--     gls.left[6] = {
--         DiffRemove = {
--             provider = 'DiffRemove',
--             condition = condition.hide_in_width,
--             icon = '  ',
--             highlight = {Globals.colors.red, Globals.colors.bg}
--         }
--     }

--     -- gls.left[7] = {
--     --     RelativePath = {
--     --         provider = function()
--     --             local path = vim.fn.fnamemodify(vim.fn.expand '%:p:h', ':~:.')
--     --             local file = vim.fn.fnamemodify(vim.fn.expand '%:t', ':~:.')
--     --             if vim.fn.empty(file) == 1 then return '' end
--     --             if vim.bo.filetype == 'startify' then return '' end
--     --             vim.api.nvim_command('hi GalaxyRelativePath guifg=' .. mode_color[vim.fn.mode()])
--     --             return path .. '/'
--     --         end
--     --     }
--     -- }

--     gls.left[8] = {
--         FileName = {
--             provider = function(modified_icon, readonly_icon)
--                 local file = vim.fn.fnamemodify(vim.fn.expand '%', ':~:.')
--                 -- local file = vim.fn.fnamemodify(vim.fn.expand '%:t', ':~:.')
--                 if vim.fn.empty(file) == 1 then return '' end
--                 if vim.bo.filetype == 'startify' then return '' end

--                 modified_icon = modified_icon or ''
--                 readonly_icon = readonly_icon or ''

--                 local readonly = vim.bo.readonly
--                 if vim.bo.filetype == 'help' then
--                     readonly = false
--                 end

--                 if readonly then
--                     file = readonly_icon .. ' ' .. file
--                 end

--                 -- local is_modified = vim.api.nvim_buf_get_option(vim.fn.bufnr, 'modified')
--                 if vim.bo.modifiable and vim.bo.modified then
--                     file = file .. ' ' .. modified_icon
--                     vim.api.nvim_command('hi GalaxyFileName guifg=' .. Globals.colors.yellow)
--                 else
--                     vim.api.nvim_command('hi GalaxyFileName guifg=' .. Globals.colors.white)
--                 end

--                 return file .. ' '
--             end,
--             condition = condition.hide_in_width,
--             icon = ' @ ',
--             highlight = {Globals.colors.white, Globals.colors.bg}
--         }
--     }

--     gls.right[1] = {
--         DiagnosticError = {
--             provider = 'DiagnosticError',
--             icon = '  ',
--             highlight = {Globals.colors.red, Globals.colors.bg}
--         }
--     }
--     gls.right[2] = {
--         DiagnosticWarn = {
--             provider = 'DiagnosticWarn',
--             icon = '  ',
--             highlight = {Globals.colors.orange, Globals.colors.bg}
--         }
--     }

--     gls.right[3] = {
--         DiagnosticHint = {
--             provider = 'DiagnosticHint',
--             icon = '  ',
--             highlight = {Globals.colors.blue, Globals.colors.bg}
--         }
--     }

--     gls.right[4] = {
--         DiagnosticInfo = {
--             provider = 'DiagnosticInfo',
--             icon = '  ',
--             highlight = {Globals.colors.yellow, Globals.colors.bg}
--         }
--     }

--     gls.right[5] = {
--         ShowLspClient = {
--             provider = 'GetLspClient',
--             condition = function()
--                 local tbl = {['dashboard'] = true, [' '] = true}
--                 if tbl[vim.bo.filetype] then return false end
--                 return true
--             end,
--             icon = '  ',
--             highlight = {Globals.colors.gray, Globals.colors.bg}
--         }
--     }

--     gls.right[6] = {
--         LineInfo = {
--             provider = 'LineColumn',
--             separator = '  ',
--             separator_highlight = {'NONE', Globals.colors.bg},
--             highlight = {Globals.colors.gray, Globals.colors.bg}
--         }
--     }

--     gls.right[7] = {
--         PerCent = {
--             provider = 'LinePercent',
--             separator = ' ',
--             separator_highlight = {'NONE', Globals.colors.bg},
--             highlight = {Globals.colors.gray, Globals.colors.bg}
--         }
--     }

--     gls.right[8] = {
--         Tabstop = {
--             provider = function()
--                 -- check for mixed indent
--                 local tabs = vim.fn.search('^\t', 'nw')
--                 local spaces = vim.fn.search('^ ', 'nw')

--                 local type = 'Spaces'
--                 if tabs ~= 0 and spaces ~= 0 then
--                     type = 'Mixed'
--                 elseif vim.bo.expandtab ~= true then
--                     type = 'Tabs'
--                 end
--                 return type .. ': ' .. vim.api.nvim_buf_get_option(0, 'shiftwidth') .. ' '
--             end,
--             condition = condition.hide_in_width,
--             separator = ' ',
--             separator_highlight = {'NONE', Globals.colors.bg},
--             highlight = {Globals.colors.gray, Globals.colors.bg}
--         }
--     }

--     gls.right[9] = {
--         BufferType = {
--             provider = 'FileTypeName',
--             condition = condition.hide_in_width,
--             separator = ' ',
--             separator_highlight = {'NONE', Globals.colors.bg},
--             highlight = {Globals.colors.gray, Globals.colors.bg}
--         }
--     }

--     gls.right[10] = {
--         FileEncode = {
--             provider = 'FileEncode',
--             condition = condition.hide_in_width,
--             separator = ' ',
--             separator_highlight = {'NONE', Globals.colors.bg},
--             highlight = {Globals.colors.gray, Globals.colors.bg}
--         }
--     }

--     gls.right[11] = {
--         Space = {
--             provider = function()
--                 return ' '
--             end,
--             separator = ' ',
--             separator_highlight = {'NONE', Globals.colors.bg},
--             highlight = {Globals.colors.orange, Globals.colors.bg}
--         }
--     }

--     -- gls.right[115] = {
--     --     ScrollBar = {
--     --         provider = 'ScrollBar',
--     --         highlight = {Globals.colors.yellow,Globals.colors.purple},
--     --     }
--     -- }

--     gls.right[12] = {
--         TrailingWhitespace = {
--             provider = function()
--                 local trail = vim.fn.search('\\s$', 'nw')
--                 if trail ~= 0 then
--                     return ' ' -- ·
--                 else
--                     return nil
--                 end
--             end,
--             highlight = {Globals.colors.bg, Globals.colors.red},
--         }
--     }

--     gls.short_line_left[1] = {
--         BufferType = {
--             provider = 'FileTypeName',
--             separator = ' ',
--             separator_highlight = {'NONE', Globals.colors.bg},
--             highlight = {Globals.colors.gray, Globals.colors.bg}
--         }
--     }

--     gls.short_line_left[2] = {
--         SFileName = {
--             provider = 'SFileName',
--             condition = condition.buffer_not_empty,
--             highlight = {Globals.colors.gray, Globals.colors.bg}
--         }
--     }

--     gls.short_line_right[1] = {
--         BufferIcon = {
--             provider = 'BufferIcon',
--             highlight = {Globals.colors.gray, Globals.colors.bg}
--         }
--     }
end

return M
