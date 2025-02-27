return {
  'windwp/nvim-autopairs',
  event = "InsertEnter",
  config = true,
  opts = {
    disable_filetype = { "TelescopePrompt" , "guihua", "guihua_rust", "clap_input" }
  }
}
