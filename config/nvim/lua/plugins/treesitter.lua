-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "lua",
      "vim",
      -- add more arguments for adding more treesitter parsers
      "bash",
      "c",
      "javascript",
      "json",
      "lua",
      "php",
      "html",
      "bash",
      "python",
      "typescript",
      "css",
      "scss",
      "rust",
      "java",
      "yaml",
      "graphql",
      "blade",
      "pug",
    },
    context_commentstring = {
      enable = true,
      enable_autocmd = false,
    },
  },
  config = function(plugin, opts)
    local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
    parser_config.blade = {
      install_info = {
        url = "https://github.com/EmranMR/tree-sitter-blade.git",
        files = {"src/parser.c"},
        branch = "main",
      },
      filetype = "blade",
    }

    vim.filetype.add({
      pattern = {
        ['.*%.blade%.php'] = 'blade',
      },
    })

    -- opts.highlight.disable = { "php" } -- list of language that will be disabled

    require("nvim-treesitter.configs").setup(opts)
  end
}
