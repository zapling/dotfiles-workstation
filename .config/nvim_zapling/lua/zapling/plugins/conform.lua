local frontend_formatters = {
  'prettier',
  stop_after_first = true
}

local formatters_by_ft = {
  javascript = frontend_formatters,
  javascriptreact = frontend_formatters,
  typescript = frontend_formatters,
  typescriptreact = frontend_formatters,
  html = frontend_formatters,
  htmlangular = frontend_formatters,
  css = frontend_formatters,
  json = frontend_formatters,
}

local is_typescript_or_javascript = function(ft)
  if ft == "typescript" or ft == "typescriptreact" then
    return true
  end

  if ft == "javascript" or ft == "javascriptreact" then
    return true
  end

  return false
end

return {
  'stevearc/conform.nvim',
  ft = vim.tbl_keys(formatters_by_ft),
  event = { 'LspAttach' }, -- Make sure this plugin is loaded if an lsp is attached, so we get format on save setup
  cmd = { 'ConformInfo' },
  config = function()
    local conform = require('conform')

    -- Prettier should only run if we find a configuration for it.
    ---@diagnostic disable-next-line: param-type-mismatch
    conform.formatters.prettier = vim.tbl_deep_extend('force', require('conform.formatters.prettier'), {
      cwd = require('conform.util').root_file({
        '.prettierrc',
        '.prettierrc.js'
      }),
      require_cwd = true,
    })

    local augroup = vim.api.nvim_create_augroup('zapling-conform', { clear = true })
    vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
      pattern = '*',
      group = augroup,
      callback = function(args)
        local ft = vim.bo[args.buf].filetype
        if is_typescript_or_javascript(ft) then
          require('conform').format({ bufnr = args.buf, lsp_fallback = true }, function()
            require('vtsls').commands.add_missing_imports(args.buf)
          end)
          return
        end

        require('conform').format({ bufnr = args.buf, lsp_fallback = true })
      end,
      desc = 'Format with conform on save, fallback to lsp'
    })

    conform.setup({
      formatters_by_ft = formatters_by_ft,
    })
  end,
}
