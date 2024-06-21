-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

---@type LazySpec
return {
  -- {
  --   "zbirenbaum/copilot.lua",
  --   event = { "VimEnter" },
  --   config = function()
  --     vim.schedule(function()
  --       require("copilot").setup {
  --         -- cmp = {
  --         --     enabled = true,
  --         --     method = "getCompletionsCycling",
  --         -- },
  --         -- panel = { -- no config options yet
  --         --     enabled = true,
  --         -- },
  --         -- ft_disable = { "markdown" },
  --       }
  --     end)
  --   end,
  -- },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    event = "VeryLazy",
    branch = "canary",
    dependencies = {
      { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
      {
        "AstroNvim/astrocore",
        opts = function(plugin, opts)
          local maps = opts.mappings
          -- local astro = require "astrocore"
          -- local is_available = astro.is_available

          maps.n["<Leader>I"] = {
            name = " Copilot",
            -- mode = { "n", "v" },
          }
          maps.n["<Leader>i"] = {
            function()
              local input = vim.fn.input "Quick Chat: "
              if input ~= "" then
                require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
              end
            end,
            desc = "CopilotChat",
          }
          maps.v["<Leader>i"] = {
            function()
              local input = vim.fn.input "Quick Chat: "
              if input ~= "" then
                require("CopilotChat").ask(input, { selection = require("CopilotChat.select").visual })
              end
            end,
            desc = "CopilotChat",
          }
        end,
      },
    },
    opts = function(plugin, opts)
      opts.show_help = "yes"
      opts.debug = false
      opts.disable_extra_info = "no"
      opts.language = "English"
      opts.window = {
        layout = "float",
        relative = "win",
        width = 1,
        height = 0.5,
        row = 100000,
      }

      -- require("CopilotChat.integrations.cmp").setup()
      -- opts.mappings = {
      --   insert = "",
      -- }

      -- opts.prompts = {
      --   Translate = 'find german strings. make a json out if it with translations in german and english where the first level keys are ISO 639 codes of the corresponding language. in the second level should be short but descriptive unique keys in english containing only lower case characters and dashes. all translations need to have the same keys for the same content'
      -- }
    end,
    keys = {
      {
        "<Leader>Ib",
        function()
          local input = vim.fn.input "Quick Chat: "
          if input ~= "" then
            require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
          end
        end,
        desc = "CopilotChat - Buffer related chat",
      },
      {
        "<Leader>Ic",
        function()
          local input = vim.fn.input "Quick Chat: "
          if input ~= "" then
            require("CopilotChat").ask(input, { selection = require("CopilotChat.select").clipboard })
          end
        end,
        desc = "CopilotChat - Clipboard related chat",
      },
      -- {
      --   "<Leader>Is",
      --   mode = "v",
      --   function()
      --     local input = vim.fn.input "Quick Chat: "
      --     if input ~= "" then
      --       require("CopilotChat").ask(input, { selection = require("CopilotChat.select").visual })
      --     end
      --   end,
      --   desc = "CopilotChat - Selection related chat",
      -- },
      {
        "<Leader>Ih",
        function()
          local actions = require "CopilotChat.actions"
          require("CopilotChat.integrations.fzflua").pick(actions.help_actions())
        end,
        desc = "CopilotChat - Help actions",
      },
      {
        "<Leader>Ip",
        function()
          local actions = require "CopilotChat.actions"
          require("CopilotChat.integrations.fzflua").pick(actions.prompt_actions())
        end,
        desc = "CopilotChat - Prompt actions",
      },
      {
        "<Leader>Ir",
        function()
          require("CopilotChat").reset()
        end,
        desc = "CopilotChat - Reset",
      },
      {
        "<Leader>It",
        function()
          local input = vim.fn.input "Translate from language: "
          if input ~= "" then
            local prompt = "Find " .. input .. " strings. Use the result to make a JSON with translations in " .. input .. " and english (en) where the first level keys are ISO 639 codes of the corresponding language. In the second level should be short but descriptive unique keys in english containing only lower case characters and dashes. All translations need to have the same keys for the same content. If there are no " .. input .. " strings just say that there are none."
            require("CopilotChat").ask(prompt, { selection = require("CopilotChat.select").buffer })
          end
        end,
        desc = "CopilotChat - Translate buffer",
      },
    },
  },
  -- {
  --   "zbirenbaum/copilot-cmp",
  --   -- module = "copilot_cmp",
  --   after = { "copilot.lua", "nvim-cmp" },
  --   config = function()
  --     require("copilot_cmp").setup {
  --       -- method = "getPanelCompletions",
  --       method = "getCompletionsCycling",
  --     }
  --   end,
  -- },
}
