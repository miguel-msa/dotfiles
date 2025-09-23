vim.env.PATH = vim.env.PATH .. ":/opt/homebrew/bin:/usr/local/bin"

if vim.g.vscode then
	require("user.vscode_keymaps")
else
	require("core.options")
	require("core.keymaps")
	require("core.lazy")
	require("core.plugins")
end
