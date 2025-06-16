return {
    -- Core Completion & Snippets
    -- { "hrsh7th/nvim-cmp", enabled = false },
    -- { "zbirenbaum/copilot-cmp", enabled = false },
    -- { "L3MON4D3/LuaSnip", enabled = false },
    -- { "rafamadriz/friendly-snippets", enabled = false },

    -- Auto-Pairing, Tagging, Treesitter
    -- { "windwp/nvim-autopairs", enabled = false },

    -- NOTE: this plugin breaks dot repeat
    -- see: https://github.com/windwp/nvim-ts-autotag/issues/166
    {
      "windwp/nvim-ts-autotag",
      enabled = false,
      filetypes = {
        'html',
        'javascript',
        'typescript',
        'javascriptreact',
        'typescriptreact',
        'svelte',
        'vue',
        'xml',
        'markdown',
      },
    },

    -- { "nvim-treesitter/nvim-treesitter", enabled = false },
    -- { "nvim-treesitter/nvim-treesitter-textobjects", enabled = false },
    -- { "nvim-treesitter/nvim-treesitter-context", enabled = false },
    -- { "nvim-ts-context-commentstring", enabled = false },

    -- Commenting
    -- { "echasnovski/mini.comment", enabled = false },
    -- { "numToStr/Comment.nvim", enabled = false },

    -- Repeat helpers
    -- { "tpope/vim-repeat", enabled = false },

    -- AstroNvim-specific layers
    -- { "AstroNvim/astrocore", enabled = false },
    -- { "AstroNvim/astroui", enabled = false },
    -- { "AstroNvim/blink.cmp", enabled = false },
    -- { "AstroNvim/blink.compat", enabled = false },

    -- UI & Behavior
    -- { "folke/snacks.nvim", enabled = false },
    -- { "max397574/better-escape.nvim", enabled = false },

    -- Optional candidates
    -- { "nvim-lualine/lualine.nvim", enabled = false },
    -- { "rebelot/heirline.nvim", enabled = false },
    -- { "lukas-reineke/indent-blankline.nvim", enabled = false },
    -- { "nvim-neo-tree/neo-tree.nvim", enabled = false },
}
