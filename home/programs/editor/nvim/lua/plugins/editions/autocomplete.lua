return {
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"onsails/lspkind.nvim",
			"b0o/schemastore.nvim",
		},
		config = function()
			local cmp = require("cmp")
			local lspkind = require("lspkind")
			local lspconfig = require("lspconfig")
			local lsputil = require("lspconfig.util")

			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},

				performance = {
					max_view_entries = 15,
				},

				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},

				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				}),

				formatting = {
					format = lspkind.cmp_format({
						mode = "symbol",
						maxwidth = 50,
						preset = "codicons",
						ellipsis_char = "...",
						show_labelDetails = true,
					}),
				},

				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
				}, {
					{ name = "buffer" },
					{ name = "path" },
				}),
			})

			-- -- Set up lspconfig.
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			capabilities.textDocument.completion.completionItem.snippetSupport = true
			-- capabilities.textDocument.foldingRange = {
			-- 	dynamicRegistration = true,
			-- 	lineFoldingOnly = true,
			-- }

			local servers = {
				"lua_ls",
				"nil_ls",
				"eslint",
				"cssls",
				"emmet_language_server",
				"gleam",
				tsserver = {
					single_file_support = false,
					root_dir = lsputil.root_pattern("package.json", "jsconfig.json", "tsconfig.json"),
				},
				denols = {
					root_dir = lsputil.root_pattern("deno.json", "deno.jsonc"),
				},
				jsonls = {
					settings = {
						json = {
							schemas = require("schemastore").json.schemas(),
							validate = { enable = true },
						},
					},
				},
			}

			for server_name, config in pairs(servers) do
				local opts = { capabilities = capabilities }
				if type(config) == "table" then
					for key, value in pairs(config) do
						opts[key] = value
					end
				else
					server_name = config
				end
				lspconfig[server_name].setup(opts)
			end
		end,
	},
}
