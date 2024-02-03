function ColorMyPencils(color)
    color = color or "rose-pine"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        config = function()
            require("catppuccin").setup({
                disable_background = true
            })
            vim.cmd.colorscheme("catppuccin")
        end
    },
    {
        "folke/tokyonight.nvim",
        config = function()
            require("tokyonight").setup({
                -- your configuration comes here
                -- or leave it empty to use the default settings
                style = "storm", -- The theme comes in three styles `storm`, `moon`, `a darker
                transparent = true,
                terminal_colors = true,
                styles = {
                    -- Styles to be applied to different syntax groups
                    -- Value is any valid attr-list value for `:help nvim_set_hl`
                    comments = { italic = false },
                    keywords = { italic = false },
                    -- Background styles. Can be "dark", "transparent" or "normal"
                    sidebars = "dark", -- style for sidebars, see below
                    foats = "dark", -- style for floating windows
                },
            })
            --            vim.cmd("colorscheme tokyonight")
        end
    },
    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            require('rose-pine').setup({
                disable_background = true
            })
            --            vim.cmd("colorscheme rose-pine")
            ColorMyPencils()
        end
    },
    {
        "Mofiqul/dracula.nvim",
        config = function()
            require('dracula').setup({
                disable_background = true
            })
        end
    },
}

