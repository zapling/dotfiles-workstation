return {
    'ray-x/go.nvim',
    -- enabled = false,
    lazy = true,
    ft = { 'go', 'gomod' },
    opts = {
        diagnostic = false,
    },
    init = function()
        vim.api.nvim_create_user_command('GoCoverageToggle', function()
            vim.api.nvim_exec2('GoCoverage -t', {})
        end, {})
    end,
}
