require("mason").setup()
require("mason-lspconfig").setup()

local capabilities = vim.tbl_deep_extend('force', vim.lsp.protocol.make_client_capabilities(), require('cmp_nvim_lsp').default_capabilities())

require("mason-lspconfig").setup_handlers({
	function(server_name)
		require("lspconfig")[server_name].setup({
			capabilities = capabilities
		})
	end,
})

require("gen").setup({ model = "deepseek-coder-v2" })
