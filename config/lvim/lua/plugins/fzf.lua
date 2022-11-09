local M = {}

local settings = {
    -- fzf_bin = 'sk',            -- use skim instead of fzf?
    -- https://github.com/lotabout/skim
    global_resume = true, -- enable global `resume`?
    -- can also be sent individually:
    -- `<any_function>.({ gl ... })`
    global_resume_query = true, -- include typed query in `resume`?
    winopts = {
        -- split         = "belowright new",-- open in a split instead?
        -- "belowright new"  : split below
        -- "aboveleft new"   : split above
        -- "belowright vnew" : split right
        -- "aboveleft vnew   : split left
        -- Only valid when using a float window
        -- (i.e. when 'split' is not defined, default)
        height = 0.85, -- window height
        width = 0.80, -- window width
        row = 0.35, -- window row position (0=top, 1=bottom)
        col = 0.50, -- window col position (0=left, 1=right)
        -- border argument passthrough to nvim_open_win(), also used
        -- to manually draw the border characters around the preview
        -- window, can be set to 'false' to remove all borders or to
        -- 'none', 'single', 'double', 'thicc' or 'rounded' (default)
        border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
        fullscreen = false, -- start fullscreen?
        -- highlights should optimally be set by the colorscheme using
        -- FzfLuaXXX highlights. If your colorscheme doesn't set these
        -- or you wish to override its defaults use these:
        -- hl = {
        --   normal = 'Normal', -- window normal color (fg+bg)
        --   border = 'FloatBorder', -- border color
        --   help_normal = 'Normal', -- <F1> window normal
        --   help_border = 'FloatBorder', -- <F1> window border
        --   -- Only used with the builtin previewer:
        --   cursor = 'Cursor', -- cursor highlight (grep/LSP matches)
        --   cursorline = 'CursorLine', -- cursor line
        --   cursorlinenr = 'CursorLineNr', -- cursor line number
        --   search = 'IncSearch', -- search matches (ctags|help)
        --   title = 'Normal', -- preview border title (file/buffer)
        --   -- Only used with 'winopts.preview.scrollbar = 'float'
        --   scrollfloat_e = 'PmenuSbar', -- scrollbar "empty" section highlight
        --   scrollfloat_f = 'PmenuThumb', -- scrollbar "full" section highlight
        --   -- Only used with 'winopts.preview.scrollbar = 'border'
        --   scrollborder_e = 'FloatBorder', -- scrollbar "empty" section highlight
        --   scrollborder_f = 'FloatBorder', -- scrollbar "full" section highlight
        -- },
        preview = {
            -- default     = 'bat',           -- override the default previewer?
            -- default uses the 'builtin' previewer
            border = 'border', -- border|noborder, applies only to
            -- native fzf previewers (bat/cat/git/etc)
            wrap = 'nowrap', -- wrap|nowrap
            hidden = 'nohidden', -- hidden|nohidden
            vertical = 'up:60%', -- up|down:size
            horizontal = 'right:60%', -- right|left:size
            layout = 'flex', -- horizontal|vertical|flex
            flip_columns = 160, -- #cols to switch to horizontal on flex
            -- Only used with the builtin previewer:
            title = true, -- preview border title (file/buf)?
            title_align  = "left", -- left|center|right, title alignment
            scrollbar = 'float', -- `false` or string:'float|border'
            -- float:  in-window floating border
            -- border: in-border chars (see below)
            scrolloff = '-2', -- float scrollbar offset from right
            -- applies only when scrollbar = 'float'
            scrollchars  = { '█', '' }, -- scrollbar chars ({ <full>, <empty> }
            -- applies only when scrollbar = 'border'
            delay = 100, -- delay(ms) displaying the preview
            -- prevents lag on fast scrolling
            winopts = { -- builtin previewer window options
                number = true,
                relativenumber = false,
                cursorline = true,
                cursorlineopt = 'both',
                cursorcolumn = false,
                signcolumn = 'no',
                list = false,
                foldenable = false,
                foldmethod = 'manual',
            },
        },
        on_create  = function()
            -- called once upon creation of the fzf main window
            -- can be used to add custom fzf-lua mappings, e.g:
            --   vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", "<Down>",
            --     { silent = true, noremap = true })
        end,
    },
    fzf_opts = {
        -- options are sent as `<left>=<right>`
        -- set to `false` to remove a flag
        -- set to '' for a non-value flag
        -- for raw args use `fzf_args` instead
        ['--ansi'] = '',
        ['--info'] = 'inline',
        ['--height'] = '100%',
        -- ['--layout'] = 'default',
        ['--layout'] = 'reverse',
        ['--border'] = 'none',
    },
    -- fzf '--color=' options (optional)
    -- fzf_colors = {
    --       ["fg"] = { "fg", "CursorLine" },
    --       ["bg"] = { "bg", "Normal" },
    --       ["hl"] = { "fg", "Comment" },
    --       ["fg+"] = { "fg", "Normal" },
    --       ["bg+"] = { "bg", "CursorLine" },
    --       ["hl+"] = { "fg", "Statement" },
    --       ["info"] = { "fg", "PreProc" },
    --       ["prompt"] = { "fg", "Conditional" },
    --       ["pointer"] = { "fg", "Exception" },
    --       ["marker"] = { "fg", "Keyword" },
    --       ["spinner"] = { "fg", "Label" },
    --       ["header"] = { "fg", "Comment" },
    --       ["gutter"] = { "bg", "Normal" },
    --   },
}

function M.setup()
    local status_ok, fzf = pcall(require, "fzf-lua")
    if not status_ok then
        return
    end

    fzf.setup(settings)
end

return M
