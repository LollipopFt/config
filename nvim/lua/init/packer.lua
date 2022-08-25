vim.cmd('packadd packer.nvim')

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use 'lewis6991/impatient.nvim'
    use 'folke/tokyonight.nvim'
    use 'neovim/nvim-lspconfig'

    use {
        'norcalli/nvim-colorizer.lua',
        event = 'BufEnter',
        config = function() require('colorizer').setup() end
    }

    use {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        event = 'VimEnter',
        requires = { 'nvim-lua/plenary.nvim' }
    }

    use {
        'hood/popui.nvim',
        event = 'VimEnter',
        requires = 'RishabhRD/popfix',
        config = function()
            vim.ui.select = require('popui.ui-overrider')
            vim.ui.input = require('popui.input-overrider')
        end
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        event = 'VimEnter',
        cmd = 'TSUpdateSync',
        config = function() require('nvim-treesitter.configs').setup {
            ensure_installed = { 'c', 'rust', 'toml' },
            sync_install = true
        }
        require('nvim-treesitter.install').compilers = { 'clang' }
        end
    }

    use {
        'lukas-reineke/indent-blankline.nvim',
        after = 'nvim-treesitter',
        event = 'BufEnter',
        config = function() require('indent_blankline').setup {
            char = '▏',
            use_treesitter = true,
            show_first_indent_level = false,
            show_trailing_blankline_indent = false,
            show_end_of_line = true,
            show_current_context = true,
            show_current_context_start = true,
            context_char = '▏',
        }
            vim.opt.list = true
            vim.opt.listchars:append 'space:∙'
            vim.opt.listchars:append 'eol:↴'
       end
    }
    use {
        'folke/which-key.nvim',
        event = 'VimEnter',
        config = function() require('which-key').setup() end
    }

    use {
        'windwp/nvim-autopairs',
        event = 'VimEnter',
        config = function()
            require('nvim-autopairs').setup({
                map_cr = true,
                check_ts = true,
                chars = { '{', '[', '(', '"' }
            })
        end
    }

    use {
        'folke/todo-comments.nvim',
        requires = 'nvim-lua/plenary.nvim',
        event = 'VimEnter',
        config = function()
            require('todo-comments').setup {
                keywords = {
                    FIX  = { icon = '🕷' },
                    TODO = { icon = '✔ ' },
                    HACK = { icon = '🔥' },
                    WARN = { icon = '⚠ ' },
                    PERF = { icon = '⏱ ' },
                    NOTE = { icon = '📓' }
                }
            }
        end
    }

    use {
        'TimUntersberger/neogit',
        requires = 'nvim-lua/plenary.nvim',
        event = 'VimEnter',
        config = function() require('neogit').setup {} end
    }

    use {
        'folke/trouble.nvim',
        event = 'VimEnter',
        config = function()
            require('trouble').setup {
                icons = false,
                fold_open = 'ᐯ',
                fold_closed = 'ᐳ',
                indent_lines = false,
                signs = {
                    error       = '❌',
                    warning     = '⚠ ',
                    hint        = '💡',
                    information = 'ℹ '
                },
                use_diagnostic_signs = false
            }
        end
    }

    use {
        'hrsh7th/cmp-nvim-lsp',
        event = 'BufEnter'
    }
    use {
        'hrsh7th/nvim-cmp',
        event = 'BufEnter'
    }
    use {
        'L3MON4D3/LuaSnip',
        requires = 'saadparwaiz1/cmp_luasnip',
        after = 'nvim-cmp',
        config = function() require('init.lsp') end
    }
    use {
        'j-hui/fidget.nvim',
        event = 'BufEnter',
        config = function() require('fidget').setup{} end
    }
end)
