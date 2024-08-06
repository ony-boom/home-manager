-- hightlight yanked
vim.cmd([[
	augroup highlight_yank
	    autocmd!
	    au TextYankPost * silent! lua vim.highlight.on_yank { higroup='Visual', timeout=200 }
	augroup END
]])

-- vim.cmd([[
-- 	au VimEnter,VimResume * set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
-- 	  \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
-- 	  \,sm:block-blinkwait175-blinkoff150-blinkon175
-- 	au VimLeave,VimSuspend * set guicursor=a:block-blinkon0
-- ]])
--
-- vim.cmd([[
-- 	autocmd VimLeave * silent !echo -ne "\e[6 q"
-- ]])
