" wool.vim - A plugin to provide Vim syntax for the Wool language.
" Copyright (C) 2021  Connor Anderson <canderson@thaumavor.io>
"
" This program is free software; you can redistribute it and/or modify
" it under the terms of the GNU General Public License, version 2, as
" published by the Free Software Foundation.
"
" This program is distributed in the hope that it will be useful,
" but WITHOUT ANY WARRANTY; without even the implied warranty of
" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
" GNU General Public License for more details.
"
" You should have received a copy of the GNU General Public License along
" with this program.  If not, see <https://www.gnu.org/licenses/>.

if exists("b:current_syntax")
  finish
endif

syn keyword woolRepeat while loop pool
syn keyword woolConditional if then else fi case of esac
syn keyword woolClassDecl class inherits
syn keyword woolStatement let in

syn keyword woolBoolean true false
syn match woolNumber '\<-\=\d\+\>'
syn region woolString start='"' skip=/\v\\./ end='"' contains=woolSpecialChar
syn match woolSpecialChar "\\[btnfr\\"]" contained

syn keyword woolOperator isvoid
syn match woolOperator "=>\|\~=\|[<>][-=]\=\|=\|[+*\/~]"

syn match woolId "[a-z][a-zA-Z0-9_]*"
syn keyword woolType Object IO Int Str Bool SELF_TYPE
syn match woolType "[A-Z][a-zA-Z0-9_]*"

syn match woolComment "--#.*$" contains=woolTodo
syn region woolCommentBlock start='(\*' end='\*)' contains=woolTodo,woolCommentBlock
syn match woolCommentBlockError "\*)"
syn keyword woolTodo contained TODO FIXME XXX

hi def link woolConditional Conditional
hi def link woolRepeat Repeat
hi def link woolClassDecl Statement
" honestly a bit ugly
" hi def link woolClassDecl Structure
hi def link woolStatement Statement

hi def link woolBoolean Boolean
hi def link woolNumber Number
hi def link woolString String
hi def link woolSpecialChar SpecialChar

hi def link woolOperator Operator

" also a bit ugly
" hi def link woolId Identifier
hi def link woolType Type

hi def link woolComment Comment
hi def link woolCommentBlock woolComment
hi def link woolCommentBlockError Error
hi def link woolTodo Todo

let b:current_syntax = "wool"
