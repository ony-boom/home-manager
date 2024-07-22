return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
	config = function()
		require('lualine').setup {
			options = {
				theme = 'auto',
				component_separators = {
					left = '|',
					right = '|',
				},
				section_separators = {
					left = '',
					right = '',
				},
			},

		 	sections = {
    		lualine_a = {'mode'},
    		lualine_b = {'branch'},
    		lualine_c = {},
    		lualine_x = {'encoding', 'fileformat', 'filetype'},
    		lualine_y = {'progress'},
    		lualine_z = {'location'}
  		},

			extensions = {'neo-tree'},
		}
	end
}