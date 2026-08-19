return {
  {
    "snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          header = [[
          
                                                                             
                                                                             
                                                                           
             ████ ██████           █████      ██                     
            ███████████             █████                             
            █████████ ███████████████████ ███   ███████████   
           █████████  ███    █████████████ █████ ██████████████   
          █████████ ██████████ █████████ █████ █████ ████ █████   
        ███████████ ███    ███ █████████ █████ █████ ████ █████  
       ██████  █████████████████████ ████ █████ █████ ████ ██████ 
                                                                             
                                                                             
                                                                             
    ]],
        },
      },
      -- LazyVim replaced nvim-notify with snacks.notifier
      notifier = {
        timeout = 5000,
      },
    },
  },
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      opts.presets.lsp_doc_border = true
    end,
  },
  {
    "saghen/blink.cmp",
    opts = function(_, opts)
      opts.completion.menu.border = "rounded"
    end,
  },
}
