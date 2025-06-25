-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
    },
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown", "codecompanion" }
  },
  {
    "ravitemer/mcphub.nvim",
    build = "npm install -g mcp-hub@latest",
    config = function()
      require("mcphub").setup()
    end
  },
  {
    "echasnovski/mini.diff",
    config = function()
      local diff = require("mini.diff")
      diff.setup({
        -- Disabled by default
        source = diff.gen_source.none(),
      })
    end,
  },
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "folke/snacks.nvim",
      "echasnovski/mini.diff",
      "ravitemer/mcphub.nvim",
      {
        "AstroNvim/astrocore",
        opts = function(_, opts)
          local maps = opts.mappings

          -- normal mode

          maps.n["<leader>z"] = { name = "󰚩 CodeCompanion" }

          maps.n["<Leader>zz"] = {
            function()
              local input = vim.fn.input("Quick Chat: ")
              if input ~= "" then
                vim.cmd(string.format("CodeCompanion %s", input))
              end
            end,
            desc = "Quick Chat Input (Prompt)"
          }

          maps.n["<Leader>zb"] = {
            function()
              local input = vim.fn.input("Buffer Chat: ")
              if input ~= "" then
                vim.cmd(string.format("CodeCompanion #buffer %s", input))
              end
            end,
            desc = "Chat with prompt over buffer"
          }

          maps.n["<Leader>zp"] = {
            function()
              require("codecompanion").actions({})
            end,
            desc = "Open Action Palette"
          }

          maps.n["<Leader>zt"] = {
            function()
              require("codecompanion").toggle()
            end,
            desc = "Toggle Chat"
          }

          maps.n["<Leader>zr"] = {
            function()
              require("codecompanion").inline({})
            end,
            desc = "Refactor (Inline Assistant)"
          }

          maps.n["<Leader>ze"] = {
            function()
              require("codecompanion").prompt("Explain", {})
            end,
            desc = "Explain Code"
          }

          maps.n["<Leader>zx"] = {
            function()
              require("codecompanion").close_last_chat()
            end,
            desc = "Close Chat Window"
          }

          -- visual mode

          maps.v["<leader>z"] = { name = "󰚩 CodeCompanion" }

          maps.v["<Leader>zz"] = {
            function()
              local input = vim.fn.input("Quick Chat: ")
              if input ~= "" then
                require("codecompanion").inline({ args = input })
              end
            end,
            desc = "Quick Inline Chat for Selection"
          }

          maps.v["<Leader>zr"] = {
            function()
              require("codecompanion").inline({})
            end,
            desc = "Refactor Selection (Inline Assistant)"
          }

          maps.v["<Leader>ze"] = {
            function()
              require("codecompanion").prompt("Explain", {})
            end,
            desc = "Explain Selection"
          }

        end,
      },
    },
    config = function()
      require("codecompanion").setup {
        opts = { log_level = "DEBUG" },
        adapters = {
          copilot = function()
            return require("codecompanion.adapters").extend("copilot", {})
          end,
        },
        strategies = {
          chat = {
            adapter = "copilot",
            model = "claude-sonnet-4-20250514",
          },
          inline = {
            adapter = "copilot",
            model = "claude-sonnet-4-20250514",
          },
        },
        display = {
          action_palette = {
            -- width = 95,
            -- height = 10,
            -- prompt = "Prompt ", -- Prompt used for interactive LLM calls
            provider = "snacks", -- Can be "default", "telescope", "fzf_lua", "mini_pick" or "snacks". If not specified, the plugin will autodetect installed providers.
            opts = {
              show_default_actions = true, -- Show the default actions in the action palette?
              show_default_prompt_library = true, -- Show the default prompt library in the action palette?
            },
          },
          chat = {
            -- Change the default icons
            -- icons = {
            --   pinned_buffer = " ",
            --   watched_buffer = "👀 ",
            -- },

            -- Alter the sizing of the debug window
            -- debug_window = {
            --   ---@return number|fun(): number
            --   width = vim.o.columns - 5,
            --   ---@return number|fun(): number
            --   height = vim.o.lines - 2,
            -- },

            -- Options to customize the UI of the chat buffer
            window = {
              layout = "horizontal", -- float|vertical|horizontal|buffer
              -- position = nil, -- left|right|top|bottom (nil will default depending on vim.opt.splitright|vim.opt.splitbelow)
              -- border = "single",
              height = 0.5,
              -- width = 0.45,
              -- relative = "editor",
              -- full_height = true, -- when set to false, vsplit will be used to open the chat buffer vs. botright/topleft vsplit
              opts = {
                -- breakindent = true,
                -- cursorcolumn = false,
                -- cursorline = false,
                -- foldcolumn = "0",
                -- linebreak = true,
                -- list = false,
                -- numberwidth = 1,
                -- signcolumn = "no",
                -- spell = false,
                wrap = true,
              },
            },

            -- ---Customize how tokens are displayed
            -- ---@param tokens number
            -- ---@param adapter CodeCompanion.Adapter
            -- ---@return string
            -- token_count = function(tokens, adapter)
            --   return " (" .. tokens .. " tokens)"
            -- end,
          },
          diff = {
            enabled = true,
            -- close_chat_at = 240, -- Close an open chat buffer if the total columns of your display are less than...
            -- layout = "horizontal", -- vertical|horizontal split for default provider
            -- opts = {
            --   "internal",
            --   "filler",
            --   "closeoff",
            --   "algorithm:patience",
            --   "followwrap",
            --   "linematch:120",
            -- },
            provider = "mini_diff", -- default|mini_diff
          },
        },
        extensions = {
          mcphub = {
            callback = "mcphub.extensions.codecompanion",
            opts = {
              show_result_in_chat = true,  -- Show mcp tool results in chat
              make_vars = true,            -- Convert resources to #variables
              make_slash_commands = true,  -- Add prompts as /slash commands
            }
          }
        },
        -- prompt_library = {
        --   ["Quick Chat"] = {
        --     strategy = "chat",
        --     description = "Quick chat prompt",
        --     opts = {
        --       mapping = "<Leader>zz",
        --       modes = { "n" },
        --       auto_submit = true,
        --       user_prompt = true,
        --       short_name = "quick",
        --     },
        --     prompts = {
        --       {
        --         role = "user",
        --         content = "<user_prompt>{input}</user_prompt>",
        --       },
        --     },
        --   },
        --   ["Buffer Chat"] = {
        --     strategy = "chat",
        --     description = "Chat with buffer context",
        --     opts = {
        --       mapping = "<Leader>zb",
        --       modes = { "n" },
        --       auto_submit = true,
        --       user_prompt = true,
        --       short_name = "buffer",
        --     },
        --     prompts = {
        --       {
        --         role = "user",
        --         content = "<user_prompt>{input}</user_prompt>\n\nHere is the buffer context:\n```{filetype}\n{buffer}\n```",
        --       },
        --     },
        --   },
        --   ["Explain"] = {
        --     strategy = "chat",
        --     description = "Explain code under cursor",
        --     opts = {
        --       mapping = "<Leader>ze",
        --       modes = { "n" },
        --       auto_submit = true,
        --       user_prompt = true,
        --       short_name = "explain",
        --     },
        --     prompts = {
        --       {
        --         role = "user",
        --         content = "<user_prompt>{input}</user_prompt>\n\nPlease explain the code at the cursor.",
        --       },
        --     },
        --   },
        --   ["Explain Selection"] = {
        --     strategy = "chat",
        --     description = "Explain visually selected code",
        --     opts = {
        --       mapping = "<Leader>ze",
        --       modes = { "v" },
        --       auto_submit = true,
        --       user_prompt = true,
        --       short_name = "explain_sel",
        --       stop_context_insertion = true,
        --     },
        --     prompts = {
        --       {
        --         role = "user",
        --         content = function(context)
        --           local text = require("codecompanion.helpers.actions").get_code(context.start_line, context.end_line)
        --           return "Please explain the following code:\n\n```" .. context.filetype .. "\n" .. text .. "\n```"
        --         end,
        --         opts = { contains_code = true },
        --       },
        --     },
        --   },
        --   ["Inline Refactor"] = {
        --     strategy = "inline",
        --     description = "Refactor visually selected code",
        --     opts = {
        --       mapping = "<Leader>zr",
        --       modes = { "v" },
        --       auto_submit = true,
        --       user_prompt = true,
        --       short_name = "refactor",
        --     },
        --     prompts = {
        --       {
        --         role = "user",
        --         content = "<user_prompt>{input}</user_prompt>\n\nPlease refactor the selected code.",
        --       },
        --     },
        --   },
        -- },
      }
    end,
  },
}
