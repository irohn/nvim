local lsp_servers = {
	lua_ls = {},
}

require("lsp-setup").setup({
	servers = lsp_servers
})
