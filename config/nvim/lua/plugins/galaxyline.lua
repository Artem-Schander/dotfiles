local gl = require('galaxyline')
-- get my theme in galaxyline repo
-- local colors = require('galaxyline.theme').default

local condition = require('galaxyline.condition')
local gls = gl.section
gl.short_line_list = {'NvimTree', 'vista', 'dbui', 'packer'}

gls.left[1] = {
    ViMode = {
        provider = function()
            -- auto change color according the vim mode
            local mode_color = {
                n = globals.colors.blue,
                i = globals.colors.green,
                v = globals.colors.purple,
                [''] = globals.colors.purple,
                V = globals.colors.purple,
                c = globals.colors.magenta,
                no = globals.colors.blue,
                s = globals.colors.orange,
                S = globals.colors.orange,
                [''] = globals.colors.orange,
                ic = globals.colors.yellow,
                R = globals.colors.red,
                Rv = globals.colors.red,
                cv = globals.colors.blue,
                ce = globals.colors.blue,
                r = globals.colors.cyan,
                rm = globals.colors.cyan,
                ['r?'] = globals.colors.cyan,
                ['!'] = globals.colors.blue,
                t = globals.colors.blue
            }
            vim.api.nvim_command('hi GalaxyViMode guifg=' .. mode_color[vim.fn.mode()])
            return '▊ '
        end,
        highlight = {globals.colors.red, globals.colors.bg}
    }
}
print(vim.fn.getbufvar(0, 'ts'))
vim.fn.getbufvar(0, 'ts')

gls.left[2] = {
    GitIcon = {
        provider = function()
            return ' '
        end,
        condition = condition.check_git_workspace,
        separator = ' ',
        separator_highlight = {'NONE', globals.colors.bg},
        highlight = {globals.colors.orange, globals.colors.bg}
    }
}

gls.left[3] = {
    GitBranch = {
        provider = 'GitBranch',
        condition = condition.check_git_workspace,
        separator = ' ',
        separator_highlight = {'NONE', globals.colors.bg},
        highlight = {globals.colors.grey, globals.colors.bg}
    }
}

gls.left[4] = {
    DiffAdd = {
        provider = 'DiffAdd',
        condition = condition.hide_in_width,
        icon = '  ',
        highlight = {globals.colors.green, globals.colors.bg}
    }
}
gls.left[5] = {
    DiffModified = {
        provider = 'DiffModified',
        condition = condition.hide_in_width,
        icon = ' 柳',
        highlight = {globals.colors.blue, globals.colors.bg}
    }
}
gls.left[6] = {
    DiffRemove = {
        provider = 'DiffRemove',
        condition = condition.hide_in_width,
        icon = '  ',
        highlight = {globals.colors.red, globals.colors.bg}
    }
}

gls.left[7] = {
    FileName = {
        provider = function(modified_icon, readonly_icon)
            local file = vim.fn.fnamemodify(vim.fn.expand '%', ':~:.')
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

            -- vim.api.nvim_command('hi GalaxyFileName guifg=' .. globals.colors.white)
            if vim.bo.modifiable and vim.bo.modified then
                file = file .. ' ' .. modified_icon
                vim.api.nvim_command('hi GalaxyFileName guifg=' .. globals.colors.orange)
            end

            return ' ' .. file .. ' '
        end,
        condition = condition.hide_in_width,
        icon = '  ',
        highlight = {globals.colors.white, globals.colors.bg}
    }
}

gls.right[1] = {
    DiagnosticError = {
        provider = 'DiagnosticError',
        icon = '  ',
        highlight = {globals.colors.error_red, globals.colors.bg}
    }
}
gls.right[2] = {
    DiagnosticWarn = {
        provider = 'DiagnosticWarn',
        icon = '  ',
        highlight = {globals.colors.orange, globals.colors.bg}
    }
}

gls.right[3] = {
    DiagnosticHint = {
        provider = 'DiagnosticHint',
        icon = '  ',
        highlight = {globals.colors.vivid_blue, globals.colors.bg}
    }
}

gls.right[4] = {
    DiagnosticInfo = {
        provider = 'DiagnosticInfo',
        icon = '  ',
        highlight = {globals.colors.info_yellow, globals.colors.bg}
    }
}

gls.right[5] = {
    ShowLspClient = {
        provider = 'GetLspClient',
        condition = function()
            local tbl = {['dashboard'] = true, [' '] = true}
            if tbl[vim.bo.filetype] then return false end
            return true
        end,
        icon = '  ',
        highlight = {globals.colors.grey, globals.colors.bg}
    }
}

gls.right[6] = {
    LineInfo = {
        provider = 'LineColumn',
        separator = '  ',
        separator_highlight = {'NONE', globals.colors.bg},
        highlight = {globals.colors.grey, globals.colors.bg}
    }
}

gls.right[7] = {
    PerCent = {
        provider = 'LinePercent',
        separator = ' ',
        separator_highlight = {'NONE', globals.colors.bg},
        highlight = {globals.colors.grey, globals.colors.bg}
    }
}

gls.right[8] = {
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
        separator_highlight = {'NONE', globals.colors.bg},
        highlight = {globals.colors.grey, globals.colors.bg}
    }
}

gls.right[9] = {
    BufferType = {
        provider = 'FileTypeName',
        condition = condition.hide_in_width,
        separator = ' ',
        separator_highlight = {'NONE', globals.colors.bg},
        highlight = {globals.colors.grey, globals.colors.bg}
    }
}

gls.right[10] = {
    FileEncode = {
        provider = 'FileEncode',
        condition = condition.hide_in_width,
        separator = ' ',
        separator_highlight = {'NONE', globals.colors.bg},
        highlight = {globals.colors.grey, globals.colors.bg}
    }
}

gls.right[11] = {
    Space = {
        provider = function()
            return ' '
        end,
        separator = ' ',
        separator_highlight = {'NONE', globals.colors.bg},
        highlight = {globals.colors.orange, globals.colors.bg}
    }
}

-- gls.right[12] = {
--     ScrollBar = {
--         provider = 'ScrollBar',
--         highlight = {globals.colors.yellow,globals.colors.purple},
--     }
-- }

gls.right[12] = {
    TrailingWhitespace = {
        provider = function()
            local trail = vim.fn.search('\\s$', 'nw')
            if trail ~= 0 then
                return ' ' -- · 
            else
                return nil
            end
        end,
        highlight = {globals.colors.bg, globals.colors.red},
    }
}

gls.short_line_left[1] = {
    BufferType = {
        provider = 'FileTypeName',
        separator = ' ',
        separator_highlight = {'NONE', globals.colors.bg},
        highlight = {globals.colors.grey, globals.colors.bg}
    }
}

gls.short_line_left[2] = {
    SFileName = {
        provider = 'SFileName',
        condition = condition.buffer_not_empty,
        highlight = {globals.colors.grey, globals.colors.bg}
    }
}

gls.short_line_right[1] = {
    BufferIcon = {
        provider = 'BufferIcon',
        highlight = {globals.colors.grey, globals.colors.bg}
    }
}
