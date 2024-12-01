local vim = vim

----------------------------------- UNMAP

vim.keymap.set('n',           '<Enter>',    '<Nop>')
vim.keymap.set('n',           '<C-n>',      '<Nop>')
vim.keymap.set('n',           '<C-p>',      '<Nop>')
vim.keymap.set('',            'Q',          '<Nop>')
vim.keymap.set('',            'q',          '<Nop>')

vim.keymap.set('n',           '<Leader>hd', '<cmd>checkhealth vim.deprecated<CR>')

vim.keymap.set('n',           'q',          require('functions').wipe_active_buffers,                                   { noremap = true, })

vim.keymap.set('x',           '<C-n>',      ':Norm ')
vim.keymap.set('n',           '<Leader>g',  '<cmd>silent !google-chrome-stable %:p<CR>')
vim.keymap.set('n',           'g<Space>',   '<cmd>silent s/\\s\\+\\%#\\s*\\|\\s*\\%#\\s\\+/ /g<CR><cmd>nohlsearch<CR>')
vim.keymap.set({ 'x', 'n', }, '<Space>',    '<Enter>',                                                                  { remap = true, })
vim.keymap.set({ 'x', 'n', }, '<Leader>q',  '<cmd>qa!<CR>')
vim.keymap.set({ 'x', 'n', }, 'Q',          '<cmd>qa!<CR>')

vim.keymap.set('n',           '<Leader>m',  require('functions').displayMessages,                                       { noremap = true, silent = true, })

----------------------------------- UNDO

vim.keymap.set('n', 'U',         require('functions').undoAllChanges, { desc = 'Undo all changes', })
vim.keymap.set('n', 'R',         require('functions').redoAllChanges, { desc = 'Redo all changes', })
vim.keymap.set('n', '<Leader>s', require('functions').deleteUndoTree, { desc = 'Delete undo tree', })

----------------------------------- FOLD

vim.keymap.set('n', 'g<Enter>',  require('functions').toggleFold,     { desc = 'Toggle fold', })

----------------------------------- ESCAPE

vim.keymap.set('t', '<Esc>',     [[<C-\><C-n>]])
vim.keymap.set('n', '<Esc>',     require('functions').cancel)

----------------------------------- WINDOW

vim.keymap.set({ 'n', 'x', }, '<C-Down>',  '<C-w>j')
vim.keymap.set({ 'n', 'x', }, '<C-Up>',    '<C-w>k')
vim.keymap.set({ 'n', 'x', }, '<C-Left>',  '<C-w>h')
vim.keymap.set({ 'n', 'x', }, '<C-Right>', '<C-w>l')

----------------------------------- EDIT

vim.keymap.set('i', '<C-BS>', '<Esc>cvb')
vim.keymap.set('n', '<BS>',   '`[v`]')
vim.keymap.set('n', 'i',      require('functions').insert, { expr = true, })

----------------------------------- TEXT OBJECTS

vim.keymap.set({ 'o', 'x', }, 'a<Space>', 'aW')
vim.keymap.set({ 'o', 'x', }, 'i<Space>', 'iW')
vim.keymap.set({ 'o', },      '<Space>',  'iW')
vim.keymap.set({ 'o', 'x', }, 'a<CR>',    'ap')
vim.keymap.set({ 'o', 'x', }, 'i<CR>',    'ip')
vim.keymap.set({ 'o', },      '<CR>',     'ip')
vim.keymap.set({ 'o', 'x', }, 'a<Tab>',   'ap')
vim.keymap.set({ 'o', 'x', }, 'i<Tab>',   'ip')
vim.keymap.set({ 'o', },      '<Tab>',    'ip')

vim.keymap.set({ 'o', 'x', }, 'q',        'iq', { remap = true, })
vim.keymap.set({ 'o', },      '(',        'i(')
vim.keymap.set({ 'o', },      ')',        'i)')
vim.keymap.set({ 'o', },      '[',        'i[')
vim.keymap.set({ 'o', },      ']',        'i]')
vim.keymap.set({ 'o', },      '{',        'i{')
vim.keymap.set({ 'o', },      '}',        'i}')
vim.keymap.set({ 'o', },      '<',        'i<')
vim.keymap.set({ 'o', },      '>',        'i>')

----------------------------------- OPERATORS

-- vim.keymap.set('x', 'p', '"_dP')
vim.keymap.set({ 'n', 'v', }, 'd',  '"_d')
vim.keymap.set('n',           'D',  '"_D')
vim.keymap.set('n',           'dd', '"_dd^')
vim.keymap.set({ 'n', 'v', }, 'x',  '"_x')
vim.keymap.set({ 'n', 'v', }, 'm',  'd')
vim.keymap.set('n',           'M',  'D')
vim.keymap.set('n',           'mm', 'dd^')
vim.keymap.set('x',           'v',  'V')

-- vim.keymap.set('n',           'V',  'mz$v`z<cmd>delmarks z<CR>')
vim.keymap.set('n', 'V', function()
  local current_pos = vim.api.nvim_win_get_cursor(0)
  vim.api.nvim_win_set_cursor(0, { current_pos[1], #vim.api.nvim_get_current_line(), })
  vim.api.nvim_feedkeys('v', 'nx', false)
  vim.api.nvim_win_set_cursor(0, current_pos)
end)

----------------------------------- READLINE

vim.keymap.set('i', '<C-a>', '<esc>I')
vim.keymap.set('i', '<C-e>', '<end>')
vim.keymap.set('i', '<C-k>', '<esc>ld$i')
vim.keymap.set('i', '<C-H>', '<C-w>')

--------------------------------- MOTIONS

vim.keymap.set({ 'x', 'n', }, 'k', 'gk')
vim.keymap.set({ 'x', 'n', }, 'j', 'gj')
vim.keymap.set({ 'x', 'n', }, 'K', function() require('functions').move_to_non_empty_line(-4) end,
  { noremap = true, })
vim.keymap.set({ 'x', 'n', }, 'J',     function() require('functions').move_to_non_empty_line(4) end, { noremap = true, })

vim.keymap.set({ 'x', 'n', }, '<C-j>', 'J')
vim.keymap.set('n',           '0',     'g0')

vim.keymap.set('n', '$', function()
  vim.fn.execute('normal! g$')
  vim.o.ve = ''
  vim.o.ve = 'all'
end)

vim.keymap.set('n',           '^',  'g^')
vim.keymap.set('n',           '&',  'g^')

vim.keymap.set({ 'n', 'x', }, ',',  function() vim.fn.search('[,.:;]') end)
vim.keymap.set({ 'n', 'x', }, '<',  function() vim.fn.search('[,.:;]', 'b') end)
vim.keymap.set({ 'n', },      '\'', function() vim.fn.search('[\'"`]') end)
vim.keymap.set({ 'n', },      '"',  function() vim.fn.search('[\'"`]', 'b') end)
vim.keymap.set({ 'n', 'x', }, ')',  function() vim.fn.search(')') end)
vim.keymap.set({ 'n', 'x', }, '(',  function() vim.fn.search('(') end)

---------------------------------- folke/lazy.nvim

vim.keymap.set('n', '<leader>l', '<cmd>Lazy<CR>')

-- vim.keymap.set({ 'x', 'o' }, '<Plug>(arpeggio-default:()', 'i(', { remap = true, })
-- vim.keymap.set({ 'x', 'o' }, '<Plug>(arpeggio-default:))', 'a)', { remap = true, })
-- vim.keymap.set({ 'x', 'o' }, '<Plug>(arpeggio-default:{)', 'i{', { remap = true, })
-- vim.keymap.set({ 'x', 'o' }, '<Plug>(arpeggio-default:})', 'a}', { remap = true, })
-- vim.keymap.set({ 'x', 'o' }, '<Plug>(arpeggio-default:[)', 'i[', { remap = true, })
-- vim.keymap.set({ 'x', 'o' }, '<Plug>(arpeggio-default:])', 'a]', { remap = true, })
-- vim.fn['arpeggio#map']('ox', '', 0, '()', 'a)')
-- vim.fn['arpeggio#map']('ox', '', 0, '{}', 'a}')
-- vim.fn['arpeggio#map']('ox', '', 0, '[]', 'a]')

-- vim.keymap.set('n',           'g<Space>',   '<cmd>silent %s/\\s\\+$//e<CR>')
-- vim.keymap.set('n',           's',         function() vim.fn.search('\\s\\+\\ze\\s*') end)
-- vim.keymap.set('n',           'S',         function() vim.fn.search('\\s\\+\\ze\\s*', 'b') end)

-- vim.keymap.set('n',           '<Leader>ti',      '<cmd>Inspect<CR>')
-- vim.keymap.set('n',           '<Leader>tt',      '<cmd>InspectTree<CR>')
-- vim.keymap.set('n',           '<Leader>tq',      '<cmd>PreviewQuery<CR>')

-- vim.keymap.set('n', 'g<Tab>', 'za')

-- vim.keymap.set('n', '<Leader>t', '<cmd>te<CR>')

-- vim.keymap.set({ 'n', 'x', }, '<Tab>',     '<C-w>w')
-- vim.keymap.set({ 'n', 'x', }, '<S-Tab>',   '<C-w>W')

-- vim.keymap.set({ 'n', 'x', }, '<C-Down>',
--   function()
--     local key = vim.api.nvim_replace_termcodes('<C-w>', true, false, true)
--     vim.api.nvim_feedkeys(key .. 'w', 'j', false)
--   end)

-- vim.cmd([[
-- nnoremap <expr> gh '`[' . strpart(getregtype(), 0, 1) . '`]'
-- ]])

-- vim.keymap.set('n', '<BS>', '"_ciw')

----------------------------------- SAVE

-- vim.keymap.set('n', '<C-s>',     '<cmd>silent write<CR>')
-- vim.keymap.set('i', '<C-s>',     '<Esc>`^<cmd>silent write<CR>')
-- vim.keymap.set('x', '<C-s>',     '<Esc><cmd>silent write<CR>')
-- vim.keymap.set('x', 'gs', '<Esc><cmd>silent write<CR>')
-- vim.keymap.set('n', 'gs', '<cmd>silent write<CR>')

----------------------------------- MOTIONS

-- vim.keymap.set({ 'x', 'n', }, 'K',     '4kg^')
-- vim.keymap.set({ 'x', 'n', }, 'J',     '4jg^')

-- vim.keymap.set('n', 'J', function()
--     vim.cmd('/\\v\\S')
--     vim.cmd('norm! 4jg^')
-- end, { noremap = true })

-- vim.keymap.set({'x', 'n', }, 'K', function()
--     vim.cmd('?\\v^\\S')
--     vim.cmd('norm! 4kg^')
-- end, { noremap = true })

-- vim.keymap.set({ 'n', 'x', }, '<Space>', function() vim.fn.search('\\s\\+', 'W') end)
-- vim.keymap.set({ 'n', 'x', }, '<Space>', function() vim.fn.search('\\s\\+', 'bW') end)
-- vim.keymap.set({ 'n', 'x', }, '<Tab>',   function() vim.fn.search('[([{]') end)
-- vim.keymap.set({ 'n', 'x', }, '<S-Tab>', function() vim.fn.search('[([{]', 'b') end)

-- vim.cmd([[
-- nnoremap J :<C-u>call search('^.\+')<CR>
-- nnoremap K :<C-u>call search('^.\+', 'b')<CR>
-- ]])
