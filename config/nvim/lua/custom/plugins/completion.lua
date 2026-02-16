return {
  {
    'saghen/blink.cmp',
    event = { "InsertEnter" },
    -- use a release tag to download pre-built binaries
    version = '1.*',
    opts = {
      -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
      -- 'super-tab' for mappings similar to vscode (tab to accept)
      -- 'enter' for enter to accept
      -- 'none' for no mappings
      --
      -- All presets have the following mappings:
      -- C-space: Open menu or open docs if already open
      -- C-n/C-p or Up/Down: Select next/previous item
      -- C-e: Hide menu
      -- C-k: Toggle signature help (if signature.enabled = true)
      --
      -- See :h blink-cmp-config-keymap for defining your own keymap
      keymap = { preset = 'super-tab' },

      -- appearance = {
        --   -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        --   -- Adjusts spacing to ensure icons are aligned
        --   nerd_font_variant = 'mono'
        -- },

        -- (Default) Only show the documentation popup when manually triggered
        completion = { documentation = { auto_show = false } },

        -- Default list of enabled providers defined so that you can extend it
        -- elsewhere in your config, without redefining it, due to `opts_extend`
        sources = {
          default = { 'lsp', 'path', 'snippets', 'buffer', 'omni' },
        },

        -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
        -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
        -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
        --
        -- See the fuzzy documentation for more information
        -- fuzzy = { implementation = "prefer_rust_with_warning" }
      },
      -- opts_extend = { "sources.default" }
    },
    -- {
      --   'hrsh7th/nvim-cmp',
      --   dependencies = {
        --     'hrsh7th/cmp-buffer',
        --     'hrsh7th/cmp-nvim-lsp',
        --     'hrsh7th/cmp-path',
        --     'quangnguyen30192/cmp-nvim-tags',
        --     'onsails/lspkind-nvim',
        --     'kyazdani42/nvim-web-devicons',
        --   },
        --   event = 'InsertEnter',
        --   config = function()
          --     local lspkind = require 'lspkind'
          --     local cmp = require 'cmp'
          --
          --     local has_words_before = function()
            --       local line, col = unpack(vim.api.nvim_win_get_cursor(0))
            --       return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match '%s' == nil
            --     end
            --
            --     local next_item = function(fallback)
              --       if cmp.visible() then
              --         cmp.select_next_item()
              --       elseif has_words_before() then
              --         cmp.complete()
              --       else
              --         fallback()
              --       end
              --     end
              --
              --     local prev_item = function(fallback)
                --       if cmp.visible() then
                --         cmp.select_prev_item()
                --       else
                --         fallback()
                --       end
                --     end
                --
                --     cmp.setup {
                  --       snippet = {
                    --         expand = function(args)
                      --           vim.snippet.expand(args.body)
                      --         end,
                      --       },
                      --       completion = {
                        --         keyword_length = 3,
                        --       },
                        --       window = {
                          --         completion = cmp.config.window.bordered(),
                          --         documentation = false,
                          --       },
                          --       formatting = {
                            --         format = lspkind.cmp_format { preset = 'default', mode = 'symbol_text', maxwidth = 50 },
                            --       },
                            --       mapping = {
                              --         -- ['<C-j>'] = cmp.mapping.confirm({ select = true }),
                              --         ['<Tab>'] = cmp.mapping(next_item, { 'i', 's' }),
                              --         ['<S-Tab>'] = cmp.mapping(prev_item, { 'i', 's' }),
                              --         ['<C-n>'] = cmp.mapping(next_item, { 'i', 's' }),
                              --         ['<C-p>'] = cmp.mapping(prev_item, { 'i', 's' }),
                              --       },
                              --       sources = {
                                --         { name = 'nvim_lsp' },
                                --         { name = 'tags' },
                                --         { name = 'path' },
                                --         { name = 'buffer' },
                                --       },
                                --     }
                                --   end,
                                -- },
  {
    'danymat/neogen',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
    },
    config = true,
    keys = {
      { '<leader>d', '<cmd>lua require"neogen".generate()<cr>', desc = 'Neogen annotation' },
    },
  },
}
