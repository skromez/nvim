local nvim_lsp = require("lspconfig")

return {
	"neovim/nvim-lspconfig",
	opts = {
		servers = {
			angularls = {
				root_dir = nvim_lsp.util.root_pattern("angular.json", "project.json"),
			},
		},
	},
}
