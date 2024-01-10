return {
  'neovim/nvim-lspconfig',
  dependencies = { 
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'hrsh7th/nvim-cmp',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-cmdline',
        'saadparwaiz1/cmp_luasnip',
        'L3MON4D3/Luasnip',
        'j-hui/fidget.nvim',
  },
  config = function()
      require('fidget').setup({})
      require('mason').setup()
      require('mason-lspconfig').setup({
          ensure_installed = {
              'lua_ls',
              'rust_analyzer',
              'gopls',
              'html',
          },
          handlers = {
               function (server_name) -- default handler (optional)
                   local capabilities = require('cmp_nvim_lsp').default_capabilities()
                   require('lspconfig')[server_name].setup {
                       capabilities = capabilities,
                   }
               end,
          }
      })

      local luasnip = require('luasnip')
      local cmp = require('cmp')

      cmp.setup({
          snippet = {
              expand = function(args)
                  luasnip.lsp_expand(args.body)
              end,
          },
          mapping = cmp.mapping.preset.insert({
              ['<C-Space>'] = cmp.mapping.complete(),
              ['<CR>'] = cmp.mapping.confirm {
                  behaviour = cmp.ConfirmBehavior.Replace,
                  select = true,
              },
              ['<Tab>'] = cmp.mapping(function(fallback)
                  if cmp.visible() then
                      cmp.select_next_item()
                  elseif luasnip.jumpable(-1) then
                      luasnip.jump(-1)
                  else
                      fallback()
                  end
              end, { 'i', 's' }),
          }),
          sources = cmp.config.sources({
              { name = 'nvim_lsp' },
              { name = 'luasnip' },
          }),
      })

      vim.diagnostic.config({
          virtual_text = true,
      })
  end,
}
