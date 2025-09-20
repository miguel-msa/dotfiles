---@module "vim.lsp.client"
---@class vim.lsp.ClientConfig
return {
	filetypes = { "javascript", "typescript", "vue", "typescriptreact", "typescript.tsx", "react" },
	settings = {
		vtsls = {
			tsserver = {
				globalPlugins = {
					{
						name = "@vue/typescript-plugin",
						location = vim.fn.stdpath("data")
							.. "/mason/packages/vue-language-server/node_modules/@vue/language-server",
						languages = { "vue" },
						configNamespace = "typescript",
					},
				},
			},
		},
	},
	on_attach = function(client, bufnr)
		if
			vim.bo[bufnr].filetype == "vue"
			or vim.bo[bufnr].filetype == "typescriptreact"
			or vim.bo[bufnr].filetype == "typescript.jsx"
		then
			client.server_capabilities.semanticTokensProvider = nil
		end
	end,
}
