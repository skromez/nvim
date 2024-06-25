return {
	{
		"skromez/llm.nvim",
		-- dir = "~/.config/nvim/llm.nvim",
		dependencies = { "nvim-neotest/nvim-nio" },
		lazy = false,
		config = function()
			local api_key = vim.env.OPENROUTER_API_KEY
			if not api_key or api_key == "" then
				vim.notify("OPENROUTER_API_KEY is not set in the environment", vim.log.levels.ERROR)
			else
				require("llm").setup({
					api_key = api_key,
					-- model = "anthropic/claude-3.5-sonnet",
					model = "deepseek/deepseek-coder",
				})
			end
		end,
		keys = {
			{
				"<leader>p",
				function()
					require("llm").open_chat()
				end,
				desc = "Open LLM Chat",
			},
		},
	},
}
