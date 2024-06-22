if !has('nvim')
	finish
endif

if exists('g:loaded_transparent')
	finish
endif
let g:loaded_transparent = 1

augroup transparent
    autocmd!
    autocmd VimEnter,ColorScheme * lua require('transparent').clear_backgrounds()
    command -bar -nargs=0 TransparentDisable lua require('transparent').disable()
    command -bar -nargs=0 TransparentEnable lua require('transparent').enable()
    command -bar -nargs=0 TransparentToggle lua require('transparent').toggle()
augroup END
