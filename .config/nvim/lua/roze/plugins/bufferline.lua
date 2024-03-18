return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    require("bufferline").setup({
      options = {
        separator_style = { "", "" },
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(_, _, diagnostics)
          local result = {}
          local symbols = { error = " ", warning = " ", info = " " }
          for name, count in pairs(diagnostics) do
            if symbols[name] and count > 0 then
              table.insert(result, symbols[name] .. count)
            end
          end
          local res = table.concat(result, " ")
          return #res > 0 and res or ""
        end,
        offsets = {
          {
            filetype = "neo-tree",
            text = "Neo-tree",
            highlight = "Directory",
            text_align = "left",
          },
        },
      },
    })
  end,
}
