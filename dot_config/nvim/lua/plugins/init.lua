local vim = vim

return {
  { 'nvim-lua/plenary.nvim', },
  { 'nvim-tree/nvim-web-devicons', },
  { 'tpope/vim-abolish', },

  {
    'nacro90/numb.nvim',
    config = function()
      require('numb').setup()
    end,
  },

  { 'windwp/nvim-ts-autotag', },

  { 'jghauser/mkdir.nvim', },

  {
    'ahmedkhalf/project.nvim',
    config = function()
      require('project_nvim').setup()
    end,
  },

  {
    'willothy/flatten.nvim',
    enabled = true,
    config = true,
    lazy = false,
    priority = 1001,
  },

  -- { 'HiPhish/rainbow-delimiters.nvim', },
  -- { 'mbbill/undotree', },
  -- { 'kana/vim-arpeggio', },

  -- { 'smjonas/inc-rename.nvim',
  --   config = function()
  --     require('inc_rename').setup()
  --   end,
  -- },

  -- { 'mattn/vim-gist',
  --   dependencies = { 'mattn/webapi-vim' },
  -- },
}

-- for key, value in pairs(plugins) do
--   plugins[key].enabled = false
-- end