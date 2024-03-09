return {
  "jackMort/ChatGPT.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "folke/trouble.nvim",
    "nvim-telescope/telescope.nvim",
  },
  keys = {
    { "<leader>cgc", "<cmd>ChatGPT<CR>", desc = "ChatGPT - Chat", mode = { "n", "v" } },
    { "<leader>cge", "<cmd>ChatGPTRun explain_code<CR>", desc = "ChatGPT - Explain Code", mode = { "n", "v" } },
    { "<leader>cgf", "<cmd>ChatGPTRun fix_bugs<CR>", desc = "ChatGPT - Fix Bugs", mode = { "n", "v" } },
  },
  config = function()
    require("chatgpt").setup({
      api_key_cmd = "pass show api/tokens/openai",
    })
  end,
}

-- Keys
-- <C-Enter> [Both] to submit.
-- <C-y> [Both] to copy/yank last answer.
-- <C-o> [Both] Toggle settings window.
-- <C-h> [Both] Toggle help window.
-- <Tab> [Both] Cycle over windows.
-- <C-f> [Chat] Cycle over modes (center, stick to right).
-- <C-c> [Both] to close chat window.
-- <C-p> [Chat] Toggle sessions list.
-- <C-u> [Chat] scroll up chat window.
-- <C-d> [Chat] scroll down chat window.
-- <C-k> [Chat] to copy/yank code from last answer.
-- <C-n> [Chat] Start new session.
-- <C-r> [Chat] draft message (create message without submitting it to server)
-- <C-r> [Chat] switch role (switch between user and assistant role to define a workflow)
-- <C-s> [Both] Toggle system message window.
-- <C-i> [Edit Window] use response as input.
-- <C-d> [Edit Window] view the diff between left and right panes and use diff-mode commands
