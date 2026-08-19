-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local bind = vim.keymap.set

-- Increment/Decrement
bind("n", "+", "<C-a>")
bind("n", "-", "<C-x>")

-- Auto indent pasted text
bind("n", "p", "]p")
bind("n", "P", "[p")

-- Jump between matching pairs
bind("n", "(", "%")
bind("n", ")", "%")
bind("n", "<TAB>", "%")

-- turn off horizontal scroll
bind("n", "<ScrollWheelRight>", "<Nop>")
bind("n", "<ScrollWheelLeft>", "<Nop>")
