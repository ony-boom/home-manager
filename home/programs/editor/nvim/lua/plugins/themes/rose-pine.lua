return {
	"rose-pine/neovim",
	name = "rose-pine",
	config = function()
		require("rose-pine").setup({
			style = {
				transparency = true,
			},
		})
	end,
}
