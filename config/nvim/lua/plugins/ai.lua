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

          maps.n["<Leader>zn"] = {
            function()
              require("codecompanion").chat()
            end,
            desc = "New Chat"
          }

          maps.n["<Leader>zc"] = {
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

          maps.n["<Leader>zz"] = {
            function()
              require("codecompanion").toggle()
            end,
            desc = "Toggle Chat"
          }

          maps.n["<Leader>zp"] = {
            function()
              require("codecompanion").actions({})
            end,
            desc = "Open Action Palette"
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

      -- {
      --   "<Leader>It",
      --   function()
      --     local input = vim.fn.input "Translate from language: "
      --     if input ~= "" then
      --       local prompt = "Find " .. input .. " strings. Use the result to make a JSON with translations in " .. input .. " and english (en) where the first level keys are ISO 639 codes of the corresponding language. In the second level should be short but descriptive unique keys in english containing only lower case characters and dashes. All translations need to have the same keys for the same content. If there are no " .. input .. " strings just say that there are none."
      --       require("CopilotChat").ask(prompt, { selection = require("CopilotChat.select").buffer })
      --     end
      --   end,
      --   desc = "CopilotChat - Translate buffer",
      -- },

          maps.n["<Leader>ze"] = {
            function()
              require("codecompanion").prompt("Translate", {})
            end,
            desc = "Explain Code"
          }

          -- visual mode

          maps.v["<leader>z"] = { name = "󰚩 CodeCompanion" }

          maps.v["<Leader>zz"] = {
            function()
              require("codecompanion").toggle()
            end,
            desc = "Toggle Chat"
          }

          maps.v["<Leader>zc"] = {
            function()
              local input = vim.fn.input("Quick Chat: ")
              if input ~= "" then
                require("codecompanion").inline({ args = input })
              end
            end,
            desc = "Quick Inline Chat for Selection"
          }

          maps.v["<Leader>zp"] = {
            function()
              require("codecompanion").actions({})
            end,
            desc = "Open Action Palette"
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
      local utils = require("user.utils")

      local function get_layout()
        local orientation = utils.get_viewport_orientation()
        if orientation == "landscape" then
          return "vertical"
        elseif orientation == "portrait" then
          return "horizontal"
        else
          return "float"
        end
      end

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
            -- model = "claude-sonnet-4-20250514",
          },
          inline = {
            adapter = "copilot",
            -- model = "claude-sonnet-4-20250514",
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
              layout = get_layout(), -- float|vertical|horizontal|buffer
              -- position = nil, -- left|right|top|bottom (nil will default depending on vim.opt.splitright|vim.opt.splitbelow)
              -- border = "single",
              height = 0.5,
              width = 0.45,
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
        prompt_library = {
          ["Code Expert"] = {
            strategy = "chat",
            description = "Get some special advice from an LLM",
            opts = {
              mapping = "<LocalLeader>ce",
              modes = { "v" },
              short_name = "expert",
              auto_submit = true,
              stop_context_insertion = true,
              user_prompt = true,
            },
            prompts = {
              {
                role = "system",
                content = function(context)
                  return "I want you to act as a senior "
                    .. context.filetype .. " developer."
                    .. " I will ask you specific questions and I want you to return concise"
                    .. " explanations and codeblock examples."
                end,
              },
              {
                role = "user",
                content = function(context)
                  local text = require("codecompanion.helpers.actions").get_code(context.start_line, context.end_line)

                  return "I have the following code:\n\n```" .. context.filetype .. "\n" .. text .. "\n```\n\n"
                end,
                opts = {
                  contains_code = true,
                }
              },
            },
          },
          ["Code Expert for the current buffer"] = {
            strategy = "chat",
            description = "Get some special advice for the current buffer from an LLM",
            opts = {
              mapping = "<LocalLeader>ce",
              modes = { "n" },
              short_name = "expert",
              auto_submit = true,
              stop_context_insertion = true,
              user_prompt = true,
            },
            prompts = {
              {
                role = "system",
                content = function(context)
                  return "I want you to act as a senior "
                    .. context.filetype .. " developer."
                    .. " I will ask you specific questions and I want you to return concise"
                    .. " explanations and codeblock examples."
                end,
              },
              {
                role = "user",
                content = function(context)
                  return "I have the following code: #buffer"
                end,
                opts = {
                  contains_code = true,
                }
              },
            },
          },
          -- ["Explain This Shit"] = {
          --   strategy = "chat",
          --   description = "Erkläre den aktuellen Buffer",
          --   opts = {
          --     auto_submit = true,
          --     stop_context_insertion = true,
          --   },
          --   prompts = {
          --     {
          --       role = "user",
          --       content = function(context)
          --         return "Erkläre den folgenden Code aus der Datei: #buffer"
          --       end,
          --     },
          --   },
          -- }


          -- {
          --   "<Leader>It",
          --   function()
          --     local input = vim.fn.input "Translate from language: "
          --     if input ~= "" then
          --       local prompt = "Find " .. input .. " strings. Use the result to make a JSON with translations in " .. input .. " and english (en) where the first level keys are ISO 639 codes of the corresponding language. In the second level should be short but descriptive unique keys in english containing only lower case characters and dashes. All translations need to have the same keys for the same content. If there are no " .. input .. " strings just say that there are none."
          --       require("CopilotChat").ask(prompt, { selection = require("CopilotChat.select").buffer })
          --     end
          --   end,
          --   desc = "CopilotChat - Translate buffer",
          -- },
          ["Translate"] = {
            strategy = "chat",
            description = "Translate the current buffer",
            opts = {
              auto_submit = true,
              stop_context_insertion = true,
            },
            prompts = {
              {
                role = "user",
                content = function(context)
                  return "I want you to act as a translator and translate the current #buffer"
                end,
              },
              {
                role = "user",
                content = function(context)
                  local from_lang = vim.fn.input("Translate from language: ")
                  if from_lang == "" then return end
                  local to_langs = vim.fn.input("Translate to languages: ")
                  if to_langs == "" then return end
                  return "Find " .. from_lang .. " strings. \n"
                    .. "Use the result to make a JSON with translations in "
                    .. from_lang .. " and " .. to_langs .. " where the first level keys are ISO 639 codes of the "
                    .. "corresponding language. In the second level should be short but descriptive "
                    .. "unique keys in english containing only lower case characters and dashes (dash case).\n"
                    .. "All translations need to have the same keys for the same content. \n"
                    .. "If there are no " .. from_lang .. " strings just say that there are none. \n"
                    -- .. "Otherwise, return a JSON code block with translations only, skip the additional info."
                end,
              },
            },
          },
        },
      }
    end,
  },
}
