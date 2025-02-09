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
    },
  },
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      opts.presets.lsp_doc_border = true
    end,
  },
  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 5000,
    },
  },
  {
    "saghen/blink.cmp",
    opts = function(_, opts)
      opts.completion.menu.border = "rounded"
    end,
  },
}
