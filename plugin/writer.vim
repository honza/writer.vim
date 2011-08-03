" Vim plugin for writing prose
" Last Change:	2011-08-02
" Maintainer:	Honza Pokorny <me@honza.ca>
" License:	BSD license

if exists("g:loaded_writer")
    finish
endif

let g:loaded_writer = 1
let g:writer_on = 0

let s:save_cpo = &cpo
set cpo&vim

let s:font = &guifont
let s:numbers = &number
let s:relative = &relativenumber
let s:spacing = &linespace
let s:cursor = &cursorline
let s:width = &textwidth
let s:status = &laststatus

function s:Toggle()
    if has('gui')
        if (g:writer_on == 0)
            set guifont=Monaco:h15
            set nonumber
            set norelativenumber
            set linespace=5
            set nocursorline
            set textwidth=75
            set laststatus=0
            let g:writer_on = 1
        else
            exe ":set guifont=" . s:font
            exe ":set linespace=" . s:spacing
            exe ":set textwidth=" . s:width
            exe ":set laststatus=" . s:status
            if (s:numbers == 0)
                set number
            endif
            if (s:relative == 0)
                set relativenumber
            endif
            if (s:cursor == 0)
                set cursorline
            endif
            let g:writer_on = 0
        endif
    else
        echo 'no gui, sorry'
    endif
endfunction

if !exists(":WriterToggle")
    command -nargs=0 WriterToggle :call s:Toggle()
endif

let &cpo = s:save_cpo
