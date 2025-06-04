return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    opts = {
      model = "gpt-4.1",
      agent = "copilot",

      window = {
        layout = "float",
        border = "rounded",
        title = "Copilot Chat"
      },

      chat_autocomplete = true,
      highlight_selection = true,
      highlight_headers = true,
      question_header = '# User ',
      answer_header = '# Copilot ',
      error_header = '# Error ',
      separator = '───',

      mappings = {
        complete = {
          insert = '<Tab>',
        },
      }
    },
    -- See Commands section for default commands if you want to lazy load on them
  },
}
