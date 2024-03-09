local bind = vim.keymap.set

-- ============= Basic Keymaps =============

-- Increment/Decrement
bind("n", "+", "<C-a>")
bind("n", "-", "<C-x>")

-- Auto indent pasted text
bind("n", "p", "]p")
bind("n", "P", "[p")
bind("n", "(", "%")
bind("n", ")", "%")
bind("n", "<TAB>", "%")

-- turn off direction keyboard, force yourself use `hjkl` !!!
bind("n", "<Left>", "<Nop>")
bind("n", "<Right>", "<Nop>")
bind("n", "<Up>", "<Nop>")
bind("n", "<Down>", "<Nop>")

-- Clear search highlights
bind("n", "<leader>sh", ":noh<CR>", { silent = true, desc = "Clear search highlights" })

-- Resize window using <ctrl> arrow keys
bind("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
bind("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
bind("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
bind("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Move Lines
bind("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
bind("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
bind("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
bind("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
bind("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
bind("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- save file
bind({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

-- better indenting
bind("v", "<", "<gv")
bind("v", ">", ">gv")

-- splits
bind("n", "<leader>w-", "<C-W>s", { desc = "Split window below", remap = true })
bind("n", "<leader>w|", "<C-W>v", { desc = "Split window right", remap = true })

-- buffers
bind("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
bind("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })

-- quit
bind("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })

-- overwrite lazyvim mappings with vim-tmux-navigator mappings
-- see: https://github.com/christoomey/vim-tmux-navigator/blob/master/plugin/tmux_navigator.vim
bind("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>")
bind("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>")
bind("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>")
bind("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>")
bind("n", "<C-\\>", "<cmd>TmuxNavigatePrevious<cr>")

-- diagnostic
local diagnostic_goto = function(next, severity)
	local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
	severity = severity and vim.diagnostic.severity[severity] or nil
	return function()
		go({ severity = severity })
	end
end

bind("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
bind("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
bind("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
