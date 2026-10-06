vim.pack.add({'https://github.com/lewis6991/gitsigns.nvim'})

require('gitsigns').setup {
    signs = {
        add          = { text = '┃' },
        change       = { text = '┃' },
        delete       = { text = '_' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
        untracked    = { text = '┆' },
    },
    signs_staged = {
        add          = { text = '┃' },
        change       = { text = '┃' },
        delete       = { text = '_' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
        untracked    = { text = '┆' },
    },
    signs_staged_enable = true,
    signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
    numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
    linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
    word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
    watch_gitdir = {
        follow_files = true
    },
    auto_attach = true,
    attach_to_untracked = false,
    current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
    current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
        delay = 1000,
        ignore_whitespace = false,
        virt_text_priority = 100,
        use_focus = true,
    },
    current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
    blame_formatter = nil, -- Use default
    sign_priority = 6,
    update_debounce = 100,
    status_formatter = nil, -- Use default
    max_file_length = 40000, -- Disable if file is longer than this (in lines)
    preview_config = {
        -- Options passed to nvim_open_win
        style = 'minimal',
        relative = 'cursor',
        row = 0,
        col = 1,
    },

    on_attach = function(bufnr)
        local gitsigns = require('gitsigns')

        local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
        end

        local wk = require('which-key')
        wk.add({'<leader>h', desc = 'git', icon = { icon = '', color = 'green'}})

        -- Navigation
        map('n', ']c', function()
            if vim.wo.diff then
                vim.cmd.normal({']c', bang = true})
            else
                gitsigns.nav_hunk('next')
            end
        end)

        map('n', '[c', function()
            if vim.wo.diff then
                vim.cmd.normal({'[c', bang = true})
            else
                gitsigns.nav_hunk('prev')
            end
        end)

        -- Actions
        map('n', '<leader>hs', gitsigns.stage_hunk, { desc = 'Stage hunk'} )
        wk.add({'<leader>hs', icon = { icon = '', color = 'green' }})
        map('n', '<leader>hr', gitsigns.reset_hunk, { desc = 'Reset hunk'} )
        wk.add({'<leader>hr', icon = { icon = '', color = 'green' }})

        map('v', '<leader>hs', function()
            gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
        end, { desc = 'Stage selection'} )

        map('v', '<leader>hr', function()
            gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
        end, { desc = 'Reset selection'} )

        map('n', '<leader>hS', gitsigns.stage_buffer, { desc = 'Stage buffer'} )
        wk.add({'<leader>hS', icon = { icon = '', color = 'green' }})
        map('n', '<leader>hR', gitsigns.reset_buffer, { desc = 'Reset buffer'} )
        wk.add({'<leader>hR', icon = { icon = '', color = 'green' }})
        map('n', '<leader>hp', gitsigns.preview_hunk, { desc = 'Preview hunk'} )
        wk.add({'<leader>hp', icon = { icon = '', color = 'green' }})
        map('n', '<leader>hi', gitsigns.preview_hunk_inline, { desc = 'Preview hunk inline'} )
        wk.add({'<leader>hi', icon = { icon = '', color = 'green' }})

        map('n', '<leader>hb', function()
            gitsigns.blame_line({ full = true })
        end, { desc = 'blame'} )
        wk.add({'<leader>hb', icon = { icon = '', color = 'green' }})

        map('n', '<leader>hd', gitsigns.diffthis, { desc = 'diff'} )
        wk.add({'<leader>hd', icon = { icon = '', color = 'green' }})

        map('n', '<leader>hD', function()
            gitsigns.diffthis('~')
        end)
        wk.add({'<leader>hD', icon = { icon = '', color = 'green' }})

        map('n', '<leader>hQ', function() gitsigns.setqflist('all') end)
        wk.add({'<leader>hQ', icon = { icon = '', color = 'green' }})
        map('n', '<leader>hq', gitsigns.setqflist, { desc = 'Show changelist'} )
        wk.add({'<leader>hq', icon = { icon = '', color = 'green' }})

        -- Toggles
        map('n', '<leader>tb', gitsigns.toggle_current_line_blame, { desc = 'Toggle blame'} )
        map('n', '<leader>tw', gitsigns.toggle_word_diff, { desc = 'Toggle word diff'} )
        wk.add({'<leader>t', desc = 'toggles', icon = { icon = '', color = 'green'}})

        -- Text object
        map({'o', 'x'}, 'ih', gitsigns.select_hunk)
    end
}
