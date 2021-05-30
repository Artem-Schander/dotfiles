local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
    execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
    execute "packadd packer.nvim"
end

--- Check if a file or directory exists in this path
local function require_plugin(plugin)
    local plugin_prefix = fn.stdpath("data") .. "/site/pack/packer/opt/"

    local plugin_path = plugin_prefix .. plugin .. "/"
    --  print('test '..plugin_path)
    local ok, err, code = os.rename(plugin_path, plugin_path)
    if not ok then
        if code == 13 then
            -- Permission denied, but it exists
            return true
        end
    end
    --  print(ok, err, code)
    if ok then
        vim.cmd("packadd " .. plugin)
    end
    return ok, err, code
end

vim.cmd "autocmd BufWritePost plugins.lua PackerCompile" -- Auto compile when there are changes in plugins.lua

return require("packer").startup(
    function(use)
        -- Packer can manage itself as an optional plugin
        use "wbthomason/packer.nvim"

        -- TODO refactor all of this (for now it works, but yes I know it could be wrapped in a simpler function)
        use {"neovim/nvim-lspconfig", opt = true}
        use {"glepnir/lspsaga.nvim", opt = true}
        use {"kabouzeid/nvim-lspinstall", opt = true}

        -- Telescope
        use {"nvim-lua/popup.nvim", opt = true}
        use {"nvim-lua/plenary.nvim", opt = true}
        use {"nvim-telescope/telescope.nvim", opt = true}
        use {"nvim-telescope/telescope-fzf-native.nvim", run = 'make', opt = true}

        -- Debugging
        use {"mfussenegger/nvim-dap", opt = true}

        -- Autocomplete
        use {"hrsh7th/nvim-compe", opt = true}
        use {"hrsh7th/vim-vsnip", opt = true}
        use {"rafamadriz/friendly-snippets", opt = true}

        -- Treesitter
        use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
        use {"windwp/nvim-ts-autotag", opt = true}

        -- Explorer
        use {"kyazdani42/nvim-tree.lua", opt = true}
        -- TODO remove when open on dir is supported by nvimtree
        -- use "kevinhwang91/rnvimr"

        -- Comment
        use {"terrortylor/nvim-comment", opt = true}
        use {"JoosepAlviste/nvim-ts-context-commentstring", opt = true}

        -- Color
        -- use {"christianchiarulli/nvcode-color-schemes.vim", opt = true}
        use {"tomasiser/vim-code-dark", opt = true}
        use {"navarasu/onedark.nvim", opt = true}
        use {"tiagovla/tokyodark.nvim", opt = true}
        use {"marko-cerovac/material.nvim", opt = true}
        use {"bluz71/vim-nightfly-guicolors", opt = true}

        use {"norcalli/nvim-colorizer.lua", opt = true}

        -- Icons
        use {"kyazdani42/nvim-web-devicons", opt = true}

        -- Status Line and Bufferline
        use {"glepnir/galaxyline.nvim", opt = true}
        use {"romgrk/barbar.nvim", opt = true}

        -- Utils
        use {"lukas-reineke/indent-blankline.nvim", opt = true, branch = 'lua'}
        use {"lewis6991/gitsigns.nvim", opt = true}
        use {"folke/which-key.nvim", opt = true}
        use {"glepnir/dashboard-nvim", opt = true}
        use {"windwp/nvim-autopairs", opt = true}
        use {"kevinhwang91/nvim-bqf", opt = true}

        -- TODO remove when found a lua implementation
        use {"tpope/vim-surround"}
        use {"tpope/vim-repeat"}
        use {"editorconfig/editorconfig-vim"}
        use {"lfv89/vim-interestingwords"}
        use {"mhinz/vim-startify"}
        use {"tpope/vim-obsession"}
        use {"dhruvasagar/vim-prosession"}
        use {"janko-m/vim-test"}
        use {"embear/vim-localvimrc"}
        use {"easymotion/vim-easymotion"}
        use {"ntpeters/vim-better-whitespace"}

        -- TODO remove when treesitter supports corresponding languages
        use {"cakebaker/scss-syntax.vim", ft = {'sass', 'scss', 'html', 'phtml', 'vue'}}
        use {"digitaltoad/vim-pug", ft = {'jade', 'pug', 'vue'}}
        use {"jparise/vim-graphql", ft = {'gql', 'graphql', 'graphqls'}}

        require_plugin("nvim-lspconfig")
        require_plugin("lspsaga.nvim")
        require_plugin("nvim-lspinstall")
        require_plugin("friendly-snippets")
        require_plugin("telescope.nvim")
        require_plugin("telescope-fzf-native.nvim")
        require_plugin("popup.nvim")
        require_plugin("plenary.nvim")
        require_plugin("nvim-dap")
        require_plugin("nvim-compe")
        require_plugin("vim-vsnip")
        require_plugin("nvim-treesitter")
        require_plugin("nvim-ts-autotag")
        require_plugin("nvim-tree.lua")
        require_plugin("indent-blankline.nvim")
        require_plugin("gitsigns.nvim")
        -- require_plugin("which-key.nvim")
        -- require_plugin("dashboard-nvim")
        require_plugin("nvim-autopairs")
        require_plugin("nvim-comment")
        require_plugin("nvim-ts-context-commentstring")
        require_plugin("nvim-bqf")
        -- require_plugin("nvcode-color-schemes.vim")
        require_plugin("vim-code-dark")
        require_plugin("onedark.nvim")
        require_plugin("tokyodark.nvim")
        require_plugin("material.nvim")
        require_plugin("vim-nightfly-guicolors")
        require_plugin("nvim-colorizer.lua")
        require_plugin("nvim-web-devicons")
        require_plugin("galaxyline.nvim")
        require_plugin("barbar.nvim")
        -- require_plugin("rnvimr")
    end
)
