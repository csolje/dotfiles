return {
    {
        "lewis6991/gitsigns.nvim",
        lazy = false,
        config = function()
            -- local icons = require('config.icons')
            require("gitsigns").setup({
                signs = {
                    add = { text = "┃" },
                    change = { text = "┃" },
                    delete = { text = "_" },
                    topdelete = { text = "‾" },
                    changedelete = { text = "~" },
                    untracked = { text = "┆" },
                },
                signs_staged = {
                    add = { text = "┃" },
                    change = { text = "┃" },
                    delete = { text = "_" },
                    topdelete = { text = "‾" },
                    changedelete = { text = "~" },
                    untracked = { text = "┆" },
                },
                signcolumn = true,
                numhl = false,
                linehl = false,
                word_diff = false,
                watch_gitdir = {
                    interval = 1000,
                    follow_files = true,
                },
                attach_to_untracked = true,
                current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
                current_line_blame_opts = {
                    virt_text = true,
                    virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
                    delay = 1000,
                    ignore_whitespace = false,
                },
                current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
                sign_priority = 6,
                status_formatter = nil,
                update_debounce = 200,
                max_file_length = 40000,
                preview_config = {
                    border = "rounded",
                    style = "minimal",
                    relative = "cursor",
                    row = 0,
                    col = 1,
                },
                -- yadm = { enable = false },

                on_attach = function(bufnr)
                    vim.keymap.set(
                        "n",
                        "<leader>H",
                        require("gitsigns").preview_hunk,
                        { buffer = bufnr, desc = "Preview git hunk" }
                    )

                    vim.keymap.set("n", "]]", require("gitsigns").next_hunk, { buffer = bufnr, desc = "Next git hunk" })

                    vim.keymap.set("n", "[[", require("gitsigns").prev_hunk, { buffer = bufnr, desc = "Previous git hunk" })
                end,
            })
        end,
        keys = {
            {
                "<leader>Gk",
                function()
                    require("gitsigns").prev_hunk({ navigation_message = false })
                end,
                desc = "Prev Hunk",
            },
            {
                "<leader>Gl",
                function()
                    require("gitsigns").blame_line()
                end,
                desc = "Blame",
            },
            {
                "<leader>Gp",
                function()
                    require("gitsigns").preview_hunk()
                end,
                desc = "Preview Hunk",
            },
            {
                "<leader>Gr",
                function()
                    require("gitsigns").reset_hunk()
                end,
                desc = "Reset Hunk",
            },
            {
                "<leader>GR",
                function()
                    require("gitsigns").reset_buffer()
                end,
                desc = "Reset Buffer",
            },
            {
                "<leader>Gj",
                function()
                    require("gitsigns").next_hunk({ navigation_message = false })
                end,
                desc = "Next Hunk",
            },
            {
                "<leader>Gs",
                function()
                    require("gitsigns").stage_hunk()
                end,
                desc = "Stage Hunk",
            },
            {
                "<leader>Gu",
                function()
                    require("gitsigns").undo_stage_hunk()
                end,
                desc = "Undo Stage Hunk",
            },
            -- {
                --   "<leader>Go", require("telescope.builtin").git_status,
                --   desc = "Open changed file"
                -- },
                -- {
                    --   "<leader>Gb", require("telescope.builtin").git_branches,
                    --   desc = "Checkout branch"
                    -- },
                    -- {
                        --   "<leader>Gc", require("telescope.builtin").git_commits,
                        --   desc = "Checkout commit"
                        -- },
                        -- {
                            --   "<leader>GC", require("telescope.builtin").git_bcommits,
                            --   desc = "Checkout commit(for current file)"
                            -- },
                            {
                                "<leader>Gd",
                                function()
                                    vim.cmd("Gitsigns diffthis HEAD")
                                end,
                                desc = "Git Diff HEAD",
                            },
                        },
                    },
                    {
                        "sindrets/diffview.nvim",
                        event = "VeryLazy",
                        cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
                    },
                    -- Git related plugins
                    {
                        "tpope/vim-fugitive",
                        config = function()
                            vim.keymap.set("n", "<leader>gs", vim.cmd.Git);
                            vim.keymap.set("n", "<leader>ga", vim.cmd.Gwrite);
                            vim.keymap.set("n", "<leader>gb", function()
                                vim.cmd.Git('blame')
                            end);

                            local myFugitive = vim.api.nvim_create_augroup("myFugitive", {})

                            local autocmd = vim.api.nvim_create_autocmd
                            autocmd("BufWinEnter", {
                                group = myFugitive,
                                pattern = "*",
                                callback = function()
                                    if vim.bo.ft ~= "fugitive" then
                                        return
                                    end

                                    local bufnr = vim.api.nvim_get_current_buf()
                                    local opts = {buffer = bufnr, remap = false}
                                    vim.keymap.set("n", "<leader>P", function()
                                        vim.cmd.Git('push')
                                    end, opts)

                                    vim.keymap.set("n", "<leader>p", function()
                                        vim.cmd.Git({'pull', '--rebase'})
                                    end, opts)

                                    -- show the git log
                                    vim.keymap.set("n", "<leader>l", function()
                                        vim.cmd.Git('log')
                                    end, opts)
                                    -- NOTE: It allows me to easily set the branch i am pushing and any tracking
                                    -- needed if i did not set the branch up correctly
                                    vim.keymap.set("n", "<leader>t", ":Git push -u origin ", opts);
                                end,
                            })


                            vim.keymap.set("n", "gu", "<cmd>diffget //2<CR>")
                            vim.keymap.set("n", "gh", "<cmd>diffget //3<CR>")
                        end
                    },

                    "tpope/vim-rhubarb",

                    -- not git, but it's okay
                    {
                        "mbbill/undotree",
                        keys = {
                            {
                                "<leader>GU",
                                ":UndotreeToggle<CR>",
                                desc = "Toggle UndoTree",
                            },
                        },
                    },
                }
