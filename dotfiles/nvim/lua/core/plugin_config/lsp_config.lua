require("mason-lspconfig").setup()

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
local lspconfig = require("lspconfig")
local util = require "lspconfig.util"

--if vim.lsp.get_clients then
--
--   clients = vim.lsp.get_clients({
--     bufnr = bufnr,
--
--   })
-- else
--   ---@diagnostic disable-next-line: deprecated 
--   clients = vim.lsp.get_active_clients({
--     bufnr = bufnr,
--   })
--end

require('lspsaga').setup({
  code_action_icon = "💡",
  symbol_in_winbar = {
    in_custom = false,
    enable = true,
    separator = ' ',
    show_file = true,
    file_formatter = ""
  },
})

vim.keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<cr>", { silent = true })
vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<cr>', { silent = true })
vim.keymap.set({"n","t"}, "<C-w>t", "<cmd>Lspsaga term_toggle<cr>", { silent = true})
--vim.keymap.set({"n","v"}, "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true })
vim.keymap.set("n", "<leader>r", "<cmd>Lspsaga rename<CR>", { silent = true })
vim.keymap.set("n", "<leader>f", "<cmd>Lspsaga finder<CR>", { silent = true }) --<C-c>k to close

lspconfig.lua_ls.setup {
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.stdpath "config" .. "/lua"] = true,
        },
      },
    },
  }
}

--lspconfig.tsserver.setup {
--  capabilities = capabilities,
--}

lspconfig.ts_ls.setup { -- Typescript
  capabilities = capabilities,
  -- install: npm i -g @vue/typescript-plugin
  --cmd = lsp_containers.command("ts_ls"),
  settings = {
    ts_ls_plugins = {
      "@vue/typescript-plugin",
    },
  },
  filetypes = {
    "javascript",
    "typescript",
    "vue",
  },
}

--[[Vue LS Config]]

local mason_registry = require('mason-registry')
local vue_language_server_path = mason_registry.get_package('vue-language-server'):get_install_path() .. '/node_modules/@vue/language-server'

lspconfig.ts_ls.setup {
  init_options = {
    plugins = {
      {
        name = '@vue/typescript-plugin',
        location = vue_language_server_path,
        languages = { 'vue' },
      },
    },
  },
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
}

-- No need to set `hybridMode` to `true` as it's the default value
lspconfig.volar.setup {}


lspconfig.pyright.setup { -- Python
  capabilities = capabilities,
}
lspconfig.rust_analyzer.setup({ -- Rust
  capabilities = capabilities,
  filetypes = {"rust"},
  root_dir = util.root_pattern("Cargo.toml"),
  settings = {
    ['rust-analyzer'] = {
      cargo = {
        allFeatures = true,
      },
    },
  },
})
lspconfig.gopls.setup({ -- Go
  capabilities = capabilities,
  cmd = {"gopls"},
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      }
    }
  }
})
