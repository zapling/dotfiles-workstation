local skeletons = {
    { pattern = '.envrc',     skeleton_file = '~/.config/nvim_zap25/skeleton/.envrc' },
    { pattern = 'index.html', skeleton_file = '~/.config/nvim_zap25/skeleton/index.html' },
    { pattern = '*.sh',       skeleton_file = '~/.config/nvim_zap25/skeleton/script.sh' },
    {
        pattern = '*.go',
        callback = function(args)
            if vim.fn.fnamemodify(args.file, ':t') == 'main.go' then
                vim.cmd('silent! 0r ~/.config/nvim_zap25/skeleton/main.go')
                return
            end
            local dirname = vim.fn.expand('%:p:h:t')
            vim.cmd('silent! 0r ~/.config/nvim_zap25/skeleton/file.go')
            vim.cmd('%s/PLACEHOLDER/' .. dirname)
            vim.cmd('norm 0$')
        end
    },
}

local group = vim.api.nvim_create_augroup('zapling-skeleton', { clear = true })
for _, v in pairs(skeletons) do
    vim.api.nvim_create_autocmd('BufNewFile', {
        group = group,
        pattern = v.pattern,
        callback = function(args)
            local choice = vim.fn.confirm("Use skeleton template for '" .. args.file .. "'?", "&Yes\n&No")
            if choice ~= 1 then
                return
            end

            if v.callback ~= nil then
                v.callback(args)
                return
            end

            vim.cmd('silent! 0r ' .. v.skeleton_file)
        end,
    })
end
