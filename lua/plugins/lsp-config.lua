return {
	{ -- LSP Manager
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "ca", vim.lsp.buf.code_action, {})
		end,
	},

	{ -- LSP Garbber
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "bashls", "basedpyright", "quick_lint_js", "html" },
			})
		end,
	},

	{ -- LSP Connector (LSP -> nVim)
		"neovim/nvim-lspconfig",

		config = function()
			local lspconfig = require("lspconfig")

			-- Comment out these line if ur not using lsp auto-complete (lua/plugins/completion.lua)
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- "capabilities" should be removed if not using LSP auto-complete
            -- Lua
			lspconfig.lua_ls.setup({ capabilities = capabilities })

            -- Bash
            lspconfig.bashls.setup({ capabilities = capabilities })

            -- Py
			lspconfig.basedpyright.setup({ capabilities = capabilities })

            --JS
			lspconfig.quick_lint_js.setup({ capabilities = capabilities })

            -- html
            lspconfig.html.setup({ capabilities = capabilities })
		end,
	},
}
