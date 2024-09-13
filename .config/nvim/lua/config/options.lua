-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

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

-- Resize window using <ctrl> arrow keys
bind("n", "<S-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
bind("n", "<S-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
bind("n", "<S-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
bind("n", "<S-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- turn off horizontal scroll
bind("n", "<ScrollWheelRight>", "<Nop>")
bind("n", "<ScrollWheelLeft>", "<Nop>")
