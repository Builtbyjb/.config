return {
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v4.x',
    config = function()
      require('lsp-zero').setup({})
      -- lsp_attach is where you enable features that only work
      -- if there is a language server active in the file
      --lsp_zero.extend_lspconfig({
      --  sign_text = true,
      --  lsp_attach = lsp_attach,
      --  capabilities = require('cmp_nvim_lsp').default_capabilities(),
      --})
    end,

  },
  {
    'neovim/nvim-lspconfig',
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      { "antosha417/nvim-lsp-file-operations", config = true },
    },
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      local on_attach = function(client, bufnr)
        local opts = { buffer = bufnr }
        vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
        vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
        vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
        vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
        vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
        vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
        vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
        vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
        vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
        vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
      end

      lspconfig.eslint.setup({
        capabilities = capabilities,
        on_attach = function(client, bufnr)
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            command = "EslintFixAll",
          })
        end,
        filetypes = {
          "javascript",
          "javascriptreact",
          "javascript.jsx",
          "typescript",
          "typescriptreact",
          "typescript.tsx",
          "vue", "svelte",
          "astro"
        },
        cmd = { "vscode-eslint-language-server", "--stdio" },
      })

      lspconfig.emmet_ls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      lspconfig.gopls.setup({
        capabilities = capabilities,
        filetypes = { "go", "gomod", "gowork", "gotmpl" },
        on_attach = on_attach,
      })

      lspconfig.rust_analyzer.setup({
        capabilities = capabilities,
        filetypes = { "rust" },
        on_attach = on_attach,
        settings = {
          ["rust-analyzer"] = {
            check = {
              command = "clippy",
            },
            diagnostics = {
              enable = true,
              disabled = { "unresolved-proc-macro" },
            },
            imports = {
              granularity = {
                group = "module",
              },
              prefix = "self",
            },
            inlayHints = {
              parameterHints = { enable = true },
              typeHints = { enable = true },
            },
            cargo = {
              loadOutDirsFromCheck = true,
              autoreload = true,
            },
            procMacro = {
              enable = true,
            },
          }
        }
      })

      lspconfig.jdtls.setup({
        capabilities = capabilities,
        filetypes = {"java"},
        on_attach = on_attach,
      })

      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          }
        },
        on_attach = on_attach,
      })

      lspconfig["djlsp"].setup({
        capabilities = capabilities,
        filetypes = { "html", "htmldjango" },
        on_attach = on_attach,
      })

      lspconfig.pylsp.setup({
        capabilities = capabilities,
        filetypes = {
          "python",
        },
        settings = {
          pylsp = {
            plugins = {
              autopep8 = { enabled = false },
              yapf = { enabled = false },
              black = { enabled = false },
              pyls_isort = { enabled = false },
              pycodestyle = {
                maxLineLength = 100,
                indentSize = 2,
                ignore = {'E701', 'E401'},
              },
              pyflakes = { enabled = true },
              mccabe = { enabled = true },
              jedi_completion = { enabled = true },
              jedi_hover = { enabled = true },
              jedi_references = { enabled = true },
              jedi_signature_help = { enabled = true },
              jedi_symbols = { enabled = true }
            }
          }
        },
        on_attach = on_attach,
      })
    end,
  },
  {
    'hrsh7th/nvim-cmp',
    event = "InsertEnter",
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        completion = {
          completeopt = "menu,menuone,preview,noselect",
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-k>"] = cmp.mapping.select_prev_item(),
          ["<C-j>"] = cmp.mapping.select_next_item(),
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-space>"] = cmp.mapping.complete(),
          ["<C-x>"] = cmp.mapping.abort(),
          ["<C-p>"] = cmp.mapping.confirm({ select = false }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        })
      })
    end,
  },
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup()
    end,
  },
}
