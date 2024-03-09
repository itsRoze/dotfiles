return {
	{
		"williamboman/mason.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
		},
		keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
		build = ":MasonUpdate",
		config = function()
			-- enable mason and configure icons
			local mason = require("mason")
			mason.setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})

			-- enable mason_lspconfig and setup servers
			local mason_lspconfig = require("mason-lspconfig")
			mason_lspconfig.setup({
				ensure_installed = {
					"astro",
					"bashls",
					"cssls",
					"emmet_ls",
					"html",
					"lua_ls",
					"pyright",
					"tailwindcss",
					"tsserver",
				},
				automatic_installation = true, -- mason will install anything or a file not installed
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
		},
		keys = {
			{ "<leader>cl", "<cmd>LspInfo<cr>", desc = "Lsp Info" },
			{ "gR", "<cmd>Telescope lsp_references<CR>", desc = "Show LSP References" },
			{ "gD", vim.lsp.buf.declaration, desc = "Goto Declaration" },
			{ "gd", "<cmd>Telescope lsp_definitions<CR>", desc = "Show Definition" },
			{ "gi", "<cmd>Telescope lsp_implementations<CR>", desc = "Show Implementation" },
			{ "gt", "<cmd>Telescope lsp_type_definitions<CR>", desc = "Show Type Definition" },
			{ "<leader>cr", vim.lsp.buf.rename, desc = "Smart Rename" },
			{ "K", vim.lsp.buf.hover, desc = "Hover definition" },
			{ "<leader>ca", vim.lsp.buf.code_action, desc = "Code Action" },
			{ "<leader>lr", ":LspRestart<CR>", desc = "Restart LSP" },
		},
		config = function()
			-- used to enable autocompletion (assign to every lsp server config)
			local cmp_nvim_lsp = require("cmp_nvim_lsp")
			local capabilities = cmp_nvim_lsp.default_capabilities()
			local lspconfig = require("lspconfig")

			-- Change the Diagnostic symbols in the sign column (gutter)
			local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
			end

			-- setup langage servers
			lspconfig.astro.setup({
				capabilities = capabilities,
			})
			lspconfig.bashls.setup({
				capabilities = capabilities,
			})

			lspconfig.cssls.setup({
				capabilities = capabilities,
			})
			lspconfig.emmet_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.html.setup({
				capabilities = capabilities,
			})
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.pyright.setup({
				capabilities = capabilities,
			})
			lspconfig.tailwindcss.setup({
				capabilities = capabilities,
			})
			lspconfig.tsserver.setup({
				capabilities = capabilities,
			})
		end,
	},
}
