local vim = vim

return {
  'andymass/vim-matchup',

  init = function()
    vim.api.nvim_create_augroup('matchup', { clear = true, })
    vim.api.nvim_create_autocmd('ColorScheme', {
      group = 'matchup',
      pattern = '*',
      callback = function()
        vim.api.nvim_set_hl(0, 'MatchParen',
          { fg = '#7429ff', italic = true, bold = true, })
        vim.api.nvim_set_hl(0, 'MatchWord', { fg = '#7429ff', })
        vim.api.nvim_set_hl(0, 'MatchBackground', { bg = '#1a1a3b', })
      end,
    })

    vim.g.loaded_matchit = 1
    vim.g.matchup_matchparen_nomode = 'i'
    vim.g.matchup_mappings_enabled = 0
    vim.g.matchup_matchparen_pumvisible = 0
    vim.g.matchup_matchparen_deferred = 1
    vim.g.matchup_matchparen_deferred_show_delay = 50
    vim.g.matchup_matchparen_deferred_hide_delay = 50
    vim.g.matchup_motion_override_Npercent = 0
    vim.g.matchup_surround_enabled = 1
    vim.g.matchup_motion_enabled = 1
    vim.g.matchup_text_obj_enabled = 1
    vim.g.matchup_transmute_enabled = 1
    vim.g.matchup_matchparen_enabled = 1
    vim.g.matchup_override_vimtex = 1
    vim.g.matchup_matchparen_hi_background = 1
    vim.g.matchup_matchparen_offscreen = { method = 'popup', fullwidth = 1, }
  end,

  config = function()
    vim.keymap.set({ 'n', 'x', }, '%', '<plug>(matchup-%)')
    vim.keymap.set({ 'n', 'x', }, 'g%', '<plug>(matchup-g%)')
  end,
}
