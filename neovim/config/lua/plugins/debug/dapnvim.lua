local vim = vim

return {
  'jbyuki/one-small-step-for-vimkind',
  enabled = false,

  dependencies = { 'mfussenegger/nvim-dap', },

  config = function()
    require('dap').configurations.lua = {
      {
        type = 'nlua',
        request = 'attach',
        name = 'Attach to running Neovim instance',
      },
    }

    require('dap').adapters.nlua = function(callback, config)
      callback({ type = 'server', host = config.host or '127.0.0.1', port = config.port or 8086, })
    end
  end,
}
