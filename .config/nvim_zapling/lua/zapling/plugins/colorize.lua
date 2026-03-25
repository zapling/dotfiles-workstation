return {
  'catgoose/nvim-colorizer.lua',
  event = "BufReadPre",
  opts = {
    filetypes = {
      "*",
      "!lazy",
    },
    user_default_options = {
      names = false
    },
  },
}
