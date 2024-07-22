return {
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
			"nvim-neotest/neotest-jest",
		},
		discovery = {
			enabled = false,
		},
		opts = function(_, opts)
			table.insert(
				opts.adapters,
				require("neotest-jest")({
					jestCommand = "yarn test",
					jestConfigFile = "jest.config.js",
					jest_test_discovery = true,
					cwd = function()
						return vim.fn.getcwd()
					end,
				})
			)
			-- table.insert(
			-- 	opts.adapters,
			-- 	require("neotest-playwright").adapter({
			-- 		options = {
			-- 			persist_project_selection = true,
			-- 			enable_dynamic_test_discovery = true,
			-- 		},
			-- 	})
			-- )
		end,
	},
}
