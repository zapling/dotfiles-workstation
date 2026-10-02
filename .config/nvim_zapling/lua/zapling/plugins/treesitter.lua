local filetypes = {
  'lua',
  'python',

  'markdown',

  'yaml',
  'json',

  'bash',
  'make',

  'sql',

  'go',
  'gomod',
  'templ', -- https://templ.guide

  'c_sharp',

  'html',
  'css',
  'javascript',
  'typescript',
  'tsx',
  'angular',

  'terraform',
  'hcl',
  'cue',
  'jsonnet',
}

return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter').install(filetypes)

    vim.api.nvim_create_autocmd('FileType', {
      callback = function()
        -- attempt to start treesitter in all new buffers
        pcall(vim.treesitter.start)
      end,
    })

    vim.treesitter.language.register('bash', { 'dotenv' })
  end,
}
