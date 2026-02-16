return {
    {
        'nvim-lua/plenary.nvim',
    },
    {
        'kdheepak/lazygit.nvim',
        -- optional for floating window border decoration
        dependencies = 'nvim-lua/plenary.nvim',
    },
    {
        'ThePrimeagen/git-worktree.nvim'
    },
    {
        'christoomey/vim-tmux-navigator'
    },
    {
        'folke/todo-comments.nvim',
        event = 'VimEnter',
        dependencies = {
            'nvim-lua/plenary.nvim'
        },
        opts = { signs = false }
    },
}
