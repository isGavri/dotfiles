vim.cmd("set number")
vim.opt.relativenumber = true
vim.cmd("set expandtab")
vim.cmd("set mouse=a")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "
--Mappgin for movememnt between neovim windows
vim.keymap.set("n", "<C-k>", "<cmd>wincmd k<CR>", { noremap = true })
vim.keymap.set("n", "<C-j>", "<cmd>wincmd j<CR>", { noremap = true })
vim.keymap.set("n", "<C-h>", "<cmd>wincmd h<CR>", { noremap = true })
vim.keymap.set("n", "<C-l>", "<cmd>wincmd l<CR>", { noremap = true })
--Diagnosis Icons
local sign = function(opts)
  vim.fn.sign_define(opts.name, {
    texthl = opts.name,
    text = opts.text,
    numhl = "",
  })
end
sign({ name = "DiagnosticSignError", text = "✘" })
sign({ name = "DiagnosticSignWarn", text = "▲" })
sign({ name = "DiagnosticSignHint", text = "⚑" })
sign({ name = "DiagnosticSignInfo", text = "»" })
--Open Terminal
vim.keymap.set("n", "<leader>tj", "<cmd>wincmd s<CR> <cmd>wincmd j<CR> <cmd>terminal<CR>", { noremap = true })
vim.keymap.set("n", "<leader>tl", "<cmd>wincmd v<CR> <cmd>wincmd l<CR> <cmd>terminal<CR>", { noremap = true })
--Split windows
vim.keymap.set("n", "<leader>l", "<cmd>wincmd v<CR> <cmd>wincmd l<CR> <cmd>terminal<CR>", { noremap = true })
vim.keymap.set("n", "<leader>j", "<cmd>wincmd s<CR> <cmd>wincmd j<CR> <cmd>terminal<CR>", { noremap = true })
--Savin remap
vim.api.nvim_set_keymap("n", "<leader>s", ":w", { noremap = true })
--Copy paste system register
vim.api.nvim_set_keymap("v", "<leader>y", '"+y', { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>p", '"+p', { noremap = true })
--Luasnip
vim.cmd([[
imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'
smap <silent><expr> <Tab> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<Tab>'

imap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
smap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'

imap <silent><expr> <C-f> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-f>'
smap <silent><expr> <C-f> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-f>'
]])
