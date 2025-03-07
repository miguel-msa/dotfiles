--require("mason-lspconfig").setup()
--local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
--local lspconfig = require("lspconfig")
--local util = require "lspconfig.util"

--local function on_attach(client, bufnr)
--  -- Set up keybindings for LSP functions
--  local opts = { buffer = bufnr }
--
--  -- Signature Help (Manual Trigger)
--  vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, opts)
--end

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




--vim.api.nvim_create_autocmd("LspAttach", {
--  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
--  callback = function(ev)
--    -- Buffer local mappings.
--    -- See `:help vim.lsp.*` for documentation on any of the below functions
--    local opts = { buffer = ev.buf, silent = true }
--
--    -- set keybinds
--    opts.desc = "Show LSP references"
--    keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references
--
--    opts.desc = "Go to declaration"
--    keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration
--
--    opts.desc = "Show LSP definitions"
--    keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions
--
--    opts.desc = "Peek definition"
--    --keymap.set("n", "gp", "<cmd>lua require'lvim.lsp.peek'.Peek('definition')<CR>", opts) -- peek definition
--
--    opts.desc = "Show LSP implementations"
--    keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations
--
--    opts.desc = "Show LSP type definitions"
--    keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions
--
--    --opts.desc = "See available code actions"
--    --keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection
--
--    opts.desc = "Smart rename"
--    keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename
--
--    opts.desc = "Show buffer diagnostics"
--    keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file
--
--    opts.desc = "Show line diagnostics"
--    keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line
--
--    opts.desc = "Go to previous diagnostic"
--    keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer
--
--    opts.desc = "Go to next diagnostic"
--    keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer
--
--    opts.desc = "Show documentation for what is under cursor"
--    keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor
--
--    opts.desc = "Restart LSP"
--    keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
--  end,
--})

--lspconfig.lua_ls.setup {
--  capabilities = capabilities,
--  settings = {
--    Lua = {
--      diagnostics = {
--        globals = { "vim" },
--      },
--      workspace = {
--        library = {
--          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
--          [vim.fn.stdpath "config" .. "/lua"] = true,
--        },
--      },
--    },
--  }
--}
--
----lspconfig.tsserver.setup {
----  capabilities = capabilities,
----}
--
--lspconfig.ts_ls.setup { -- Typescript
--  capabilities = capabilities,
--  -- install: npm i -g @vue/typescript-plugin
--  --cmd = lsp_containers.command("ts_ls"),
--  settings = {
--    ts_ls_plugins = {
--      "@vue/typescript-plugin",
--    },
--  },
--  filetypes = {
--    "javascript",
--    "typescript",
--    "vue",
--  },
--}
--
----[[Vue LS Config]]
--
--local mason_registry = require('mason-registry')
--local vue_language_server_path = mason_registry.get_package('vue-language-server'):get_install_path() .. '/node_modules/@vue/language-server'
--
--lspconfig.ts_ls.setup {
--  init_options = {
--    plugins = {
--      {
--        name = '@vue/typescript-plugin',
--        location = vue_language_server_path,
--        languages = { 'vue' },
--      },
--    },
--  },
--  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
--}
--
---- No need to set `hybridMode` to `true` as it's the default value
--lspconfig.volar.setup {}
--
--lspconfig.html.setup{ -- Html
--  capabilities = capabilities,
--}
--lspconfig.cssls.setup{ -- css
--  capabilities = capabilities,
--}
--
---- Python
--lspconfig.pyright.setup {
--  capabilities = capabilities,
--}
--
---- Rust
--lspconfig.rust_analyzer.setup({
--  capabilities = capabilities,
--  filetypes = {"rust"},
--  root_dir = util.root_pattern("Cargo.toml"),
--  settings = {
--    ['rust-analyzer'] = {
--      cargo = {
--        allFeatures = true,
--      },
--    },
--  },
--})
--
---- Go
--lspconfig.gopls.setup({
--  capabilities = capabilities,
--  cmd = {"gopls"},
--  filetypes = { "go", "gomod", "gowork", "gotmpl" },
--  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
--  settings = {
--    gopls = {
--      completeUnimported = true,
--      usePlaceholders = true,
--      analyses = {
--        unusedparams = true,
--      }
--    }
--  }
--})
--
---- C#
--lspconfig.omnisharp.setup({
--  capabilities = capabilities,
--})
--
---- SQL
--lspconfig.sqls.setup({
--  cmd = { "sqls", "-config", vim.fn.expand("~/.config/sqls/config.yml") },
--  filetypes = { "sql" },           -- attach to SQL files explicitly
--  --root_dir = function(fname)
--  --  return vim.fn.getcwd()  -- or use a custom pattern to detect your project root
--  --end,
--  capabilities = capabilities,
--})
--
---- LATEX
--lspconfig.texlab.setup({
--  capabilities = capabilities,
--  settings = {
--    texlab = {
--      auxDirectory = ".",
--      bibtexFormatter = "texlab",
--      build = {
--        executable = "tectonic",
--        args = {
--          "-X",
--          "compile",
--          "%f",
--          "--synctex",
--          "--keep-logs",
--          "--keep-intermediates"
--        },
--        forwardSearchAfter = true,
--        onSave = false
--      },
--      chktex = {
--        onEdit = true,
--        onOpenAndSave = true
--      },
--      diagnosticsDelay = 300,
--      formatterLineLength = 80,
--      forwardSearch = {
--        executable = "C:\\Users\\WSwor\\scoop\\apps\\sioyek\\2.0.0\\sioyek",
--        args = {
--          "--reuse-window",
--          "--execute-command",
--          "toggle_synctex",
--          "--inverse-search",
--          "texlab inverse-search -i \"%%1\" -l %%2",
--          "--forward-search-file",
--          "%f",
--          "--forward-search-line",
--          "%l",
--          "%p",
--        }
--      },
--      latexFormatter = "latexindent",
--      latexindent = {
--        modifyLineBreaks = false
--      }
--    }
--  }
--})

return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/neodev.nvim", opts = {} },
  },
  config = function()
    -- import lspconfig plugin
    local lspconfig = require("lspconfig")

    local util = require "lspconfig.util"

    -- import mason_lspconfig plugin
    local mason_lspconfig = require("mason-lspconfig")

    -- import cmp-nvim-lsp plugin
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local keymap = vim.keymap -- for conciseness

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf, silent = true }

        -- set keybinds
        opts.desc = "Show LSP references"
        keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

        opts.desc = "Go to declaration"
        keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

        opts.desc = "Show LSP definitions"
        keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

        opts.desc = "Show LSP implementations"
        keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

        opts.desc = "Show LSP type definitions"
        keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

        opts.desc = "See available code actions"
        keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

        opts.desc = "Smart rename"
        keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

        opts.desc = "Show buffer diagnostics"
        keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

        opts.desc = "Show line diagnostics"
        keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

        opts.desc = "Go to previous diagnostic"
        keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

        opts.desc = "Go to next diagnostic"
        keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

        opts.desc = "Show documentation for what is under cursor"
        keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

        opts.desc = "Restart LSP"
        keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
      end,
    })

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- Change the Diagnostic symbols in the sign column (gutter)
    -- (not in youtube nvim video)
    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    mason_lspconfig.setup_handlers({
      -- default handler for installed servers
      function(server_name)
        lspconfig[server_name].setup({
          capabilities = capabilities,
        })
      end,
      ["lua_ls"] = function()
        -- configure lua server (with special settings)
        lspconfig["lua_ls"].setup({
          capabilities = capabilities,
          settings = {
            Lua = {
              -- make the language server recognize "vim" global
              diagnostics = {
                globals = { "vim" },
              },
              completion = {
                callSnippet = "Replace",
              },
            },
          },
        })
      end,
      ["ts_ls"] = function()
        local mason_registry = require('mason-registry')
        local vue_language_server_path = mason_registry.get_package('vue-language-server'):get_install_path() .. '/node_modules/@vue/language-server'

        lspconfig["ts_ls"].setup({
           -- Typescript
          capabilities = capabilities,
          -- install: npm i -g @vue/typescript-plugin
          --cmd = lsp_containers.command("ts_ls"),
          settings = {
            ts_ls_plugins = {
              "@vue/typescript-plugin",
            },
          },
          init_options = {
              plugins = {
                {
                  name = '@vue/typescript-plugin',
                  location = vue_language_server_path,
                  languages = { 'vue' },
                },
              },
          },
          filetypes = {
            "javascript",
            "typescript",
            "javascriptreact",
            "typescriptreact",
            "vue",
          },
        })
      end,
      ["volar"] = function()
        lspconfig["volar"].setup {}
      end,
      ["html"] = function()
        lspconfig["html"].setup({
          capabilities = capabilities,
        })
      end,
      ["cssls"] = function()
        lspconfig["cssls"].setup({
          capabilities = capabilities,
        })
      end,
      ["pyright"] = function()
        lspconfig["pyright"].setup({
          capabilities = capabilities,
        })
      end,
      ["rust_analyzer"] = function()
        lspconfig["rust_analyzer"].setup({
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
      end,
      ["gopls"] = function()
        lspconfig["gopls"].setup({
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
      end,
      ["omnisharp"] = function()
        local omnisharp_bin = vim.fn.stdpath("data") .. "/mason/packages/omnisharp/libexec/OmniSharp.dll"
          lspconfig.omnisharp.setup({
            capabilities = capabilities,
            cmd = { "dotnet", omnisharp_bin },
            root_dir = lspconfig.util.root_pattern("*.sln", ".git"),
          })
      end,
      ["sqls"] = function()
        lspconfig["sqls"].setup({
          capabilities = capabilities,
          cmd = { "sqls", "-config", vim.fn.expand("~/.config/sqls/config.yml") },
          filetypes = { "sql" },           -- attach to SQL files explicitly
          --root_dir = function(fname)
          --  return vim.fn.getcwd()  -- or use a custom pattern to detect your project root
          --end,
        })
      end,
      ["texlab"] = function()
        lspconfig["texlab"].setup({
          capabilities = capabilities,
          settings = {
            texlab = {
              auxDirectory = ".",
              bibtexFormatter = "texlab",
              build = {
                executable = "tectonic",
                args = {
                  "-X",
                  "compile",
                  "%f",
                  "--synctex",
                  "--keep-logs",
                  "--keep-intermediates"
                },
                forwardSearchAfter = true,
                onSave = false
              },
              chktex = {
                onEdit = true,
                onOpenAndSave = true
              },
              diagnosticsDelay = 300,
              formatterLineLength = 80,
              forwardSearch = {
                executable = "C:\\Users\\WSwor\\scoop\\apps\\sioyek\\2.0.0\\sioyek",
                args = {
                  "--reuse-window",
                  "--execute-command",
                  "toggle_synctex",
                  "--inverse-search",
                  "texlab inverse-search -i \"%%1\" -l %%2",
                  "--forward-search-file",
                  "%f",
                  "--forward-search-line",
                  "%l",
                  "%p",
                }
              },
              latexFormatter = "latexindent",
              latexindent = {
                modifyLineBreaks = false
              }
            }
          }
        })
      end,
    })
  end,
}
