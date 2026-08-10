local filetypes = {
  'bash',
  'markdown',
  'yaml',
  'json',
  'lua',
  'python',
  'sql',

  -- Go
  'go',
  'gomod',
  'templ',

  -- Frontend
  'html',
  'css',
  'javascript',
  'typescript',
  'tsx',
  'angular',

  -- Devops
  'terraform',
  'hcl',
  'cue',
}

return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter').install(filetypes)
    vim.treesitter.language.register('bash', { 'dotenv ' })
  end,
}
