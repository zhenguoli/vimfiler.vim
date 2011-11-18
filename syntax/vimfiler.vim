"=============================================================================
" FILE: syntax/vimfiler.vim
" AUTHOR: Shougo Matsushita <Shougo.Matsu@gmail.com>
" Last Modified: 30 Oct 2010
" License: MIT license  {{{
"     Permission is hereby granted, free of charge, to any person obtaining
"     a copy of this software and associated documentation files (the
"     "Software"), to deal in the Software without restriction, including
"     without limitation the rights to use, copy, modify, merge, publish,
"     distribute, sublicense, and/or sell copies of the Software, and to
"     permit persons to whom the Software is furnished to do so, subject to
"     the following conditions:
"
"     The above copyright notice and this permission notice shall be included
"     in all copies or substantial portions of the Software.
"
"     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
"     OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
"     MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
"     IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
"     CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
"     TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
"     SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
" }}}
"=============================================================================

if version < 700
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn match   vimfilerNonMarkedFile     '^\s*|\?[+-].*'
      \ contains=vimfilerNonMark,vimfilerTypeText,vimfilerTypeImage,vimfilerTypeArchive,
      \vimfilerTypeExecute,vimfilerTypeMultimedia,vimfilerTypeDirectory,vimfilerTypeSystem,vimfilerTypeLink,
      \vimfilerSize,vimfilerDate,vimfilerDateToday,vimfilerDateWeek
syn match   vimfilerMarkedFile        '^\s*|\?\* .*$'
      \ contains=vimfilerDate,vimfilerDateToday,vimfilerDateWeek
syn match   vimfilerDirectory         '^..$'

syn match   vimfilerNonMark         '^\s*|\?[+-]' contained

syn match   vimfilerPrompt            '^\%(Current directory\|CD\): .*$'
      \ contains=vimfilerSpecial,vimfilerCurrentDirectory
syn match   vimfilerPromptSafe        '^\*u\%[nsafe]\* \%(Current directory\|CD\): .*$'
      \ contains=vimfilerSpecial,vimfilerSpecialSafe,vimfilerCurrentDirectory
syn match   vimfilerSpecialSafe       '^\*u\%[nsafe]\* ' contained
syn match   vimfilerSpecial           '\%(Current directory\|CD\):' contained
syn match   vimfilerCurrentDirectory  '\s\zs.*$' contained contains=vimfilerMask
syn match   vimfilerMask  '\[.*\]$' contained
syn match   vimfilerFileLine          '\[.*\]$' contained

syn match   vimfilerTypeText          '[^[:space:]|+-].*\[TXT\]' contained
syn match   vimfilerTypeImage         '[^[:space:]|+-].*\[IMG\]' contained
syn match   vimfilerTypeArchive       '[^[:space:]|+-].*\[ARC\]' contained
syn match   vimfilerTypeExecute       '[^[:space:]|+-].*\[EXE\]' contained
syn match   vimfilerTypeMultimedia    '[^[:space:]|+-].*\[MUL\]' contained
syn match   vimfilerTypeDirectory     '[^[:space:]|+-].*\[DIR\]' contained
syn match   vimfilerTypeSystem        '[^[:space:]|+-].*\[SYS\]' contained
syn match   vimfilerTypeLink          '[^[:space:]|+-].*\[LNK\]' contained

syn match   vimfilerSize              '\s\zs[[:digit:].]\+\s*[GMKB]' contained

syn match   vimfilerDate              '#[[:digit:]/]\+\s\+\d\+:\d\+$' contains=vimfilerDateIgnore contained
syn match   vimfilerDateToday         '\~[[:digit:]/]\+\s\+\d\+:\d\+$' contains=vimfilerDateIgnore contained
syn match   vimfilerDateWeek          '![[:digit:]/]\+\s\+\d\+:\d\+$' contains=vimfilerDateIgnore contained
if has('conceal')
  " Supported conceal features.
  syn match   vimfilerDateIgnore        '[#~!]' contained conceal
else
  syn match   vimfilerDateIgnore        '[#~!]' contained
endif

if has('gui_running')
    hi vimfilerCurrentDirectory  gui=UNDERLINE guifg=#80ffff guibg=NONE
else
    hi def link vimfilerCurrentDirectory Identifier
endif
hi def link vimfilerMask Statement

hi def link vimfilerSpecial Special
hi def link vimfilerSpecialSafe Statement
hi def link vimfilerNonMark Special
"hi vimfilerMarkedFile  gui=REVERSE term=REVERSE
hi def link vimfilerMarkedFile Type
hi def link vimfilerDirectory Preproc
hi def link vimfilerSize Constant

hi def link vimfilerDateToday Statement
hi def link vimfilerDateWeek Special
hi def link vimfilerDate Identifier
hi def link vimfilerDateIgnore Ignore

hi def link vimfilerTypeText Constant
hi def link vimfilerTypeImage Type
hi def link vimfilerTypeArchive Special
hi def link vimfilerTypeExecute Statement
hi def link vimfilerTypeMultimedia Identifier
hi def link vimfilerTypeDirectory Preproc
hi def link vimfilerTypeSystem Comment
hi def link vimfilerTypeLink Comment

let b:current_syntax = "vimfiler"
