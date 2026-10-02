return {
  'sainnhe/gruvbox-material',
  lazy = false,
  priority = 1000,
  config = function()
    -- enable bold
    vim.g.gruvbox_material_enable_bold = 1

    -- disable italic
    vim.g.gruvbox_material_enable_italic = 0
    vim.g.gruvbox_material_disable_italic_comment = 1

    vim.g.gruvbox_material_background = 'hard'
    vim.g.gruvbox_material_foreground = 'original'
    vim.opt.background = 'dark'

    -- https://github.com/sainnhe/gruvbox-material/blob/master/colors/gruvbox-material.vim
    vim.api.nvim_create_autocmd('ColorScheme', {
      group = vim.api.nvim_create_augroup('custom_highlights_gruvboxmaterial', {}),
      pattern = 'gruvbox-material',
      callback = function()
        -- green strings
        vim.api.nvim_set_hl(0, 'TSString', { link = 'Green' })
        vim.api.nvim_set_hl(0, '@lsp.type.variable', { link = '@lsp' }) -- reset (no color)

        vim.api.nvim_set_hl(0, '@punctuation.delimiter', { link = 'Fg' })

        -- orange builtin funcs
        vim.api.nvim_set_hl(0, '@function.builtin', { link = 'Orange' })
        vim.api.nvim_set_hl(0, '@lsp.typemod.function.defaultLibrary', { link = '@function.builtin' })

        -- purple constants
        vim.api.nvim_set_hl(0, '@constant', { link = 'Purple' })
        vim.api.nvim_set_hl(0, '@lsp.mod.readonly', { link = 'Purple' })

        -- Language specific overrides

        -- aqua bools (matches nil etc)
        vim.api.nvim_set_hl(0, '@constant.builtin.go', { link = 'Purple' })
        vim.api.nvim_set_hl(0, '@lsp.typemod.variable.defaultLibrary.go', { link = 'Purple' })
        vim.api.nvim_set_hl(0, '@lsp.type.property.go', { link = '@lsp' }) -- reset (no color)
      end
    })

    vim.cmd.colorscheme('gruvbox-material')
  end
}
