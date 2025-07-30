return {
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    dependencies = {
      { 'github/copilot.vim' }, -- or zbirenbaum/copilot.lua
      { 'nvim-lua/plenary.nvim', branch = 'master' }, -- for curl, log and async functions
    },
    opts = {
      -- See Configuration section for options
      prompts = {
        Example = {
          prompt = 'This is an example prompt. You can use it to test Copilot Chat. CopilotChat, please respond in the affirmative that this example prompt is functional as a plugin status check.',
        },
      },
    },
    -- See Commands section for default commands if you want to lazy load on them
  },
}
