vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.g.autoformat = true

local opt = vim.opt

-- Code Folding
opt.foldlevel = 99
opt.foldmethod = "indent"
opt.foldenable = true
opt.foldexpr = "nvim_treesitter#foldexpr()"

-- search
opt.ignorecase = true -- Ignore case
opt.smartcase = true -- Don't ignore case with capitals
opt.grepprg = "rg --vimgrep"

-- line numbers
opt.number = true -- Print line number
opt.relativenumber = true -- Relative line numbers

-- splits
opt.splitbelow = true -- Put new windows below current
opt.splitkeep = "screen"
opt.splitright = true -- Put new windows right of current

-- tabs & indentation
opt.tabstop = 2 -- Number of spaces tabs count for
opt.shiftround = true -- Round indent
opt.shiftwidth = 2 -- Size of an indent
opt.expandtab = true -- Use spaces instead of tabs
opt.autoindent = true -- copy indent from current line when starting new one
opt.smartindent = true -- Insert indents automatically

-- appearance
opt.termguicolors = true -- True color support
opt.winminwidth = 5 -- Minimum window width
opt.scrolloff = 4 -- Lines of context
opt.sidescrolloff = 8 -- Columns of context
opt.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
opt.cursorline = true -- Enable highlighting of the current line
opt.winbar = "%=%m %f" -- File Name at the top

-- undo
opt.undofile = true
opt.undolevels = 10000

-- line wrapping
opt.wrap = false -- Disable line wrap

-- icons
opt.fillchars = {
	foldopen = "",
	foldclose = "",
	-- fold = "⸱",
	fold = " ",
	foldsep = " ",
	diff = "╱",
	eob = " ",
}

-- other
opt.updatetime = 200 -- Save swap file and trigger CursorHold
opt.timeoutlen = 500
opt.timeout = true
opt.clipboard = "unnamedplus" -- Sync with system clipboard
opt.completeopt = "menu,menuone,noselect"
opt.conceallevel = 2 -- Hide * markup for bold and italic, but not markers with substitutions
opt.confirm = true -- Confirm to save changes before exiting modified buffer
opt.mouse = "a" -- Enable mouse mode
opt.spelllang = { "en" }

-- smoothscroll
if vim.fn.has("nvim-0.10") == 1 then
	opt.smoothscroll = true
end

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0
