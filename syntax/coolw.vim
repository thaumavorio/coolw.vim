if exists("b:current_syntax")
  finish
endif

syn keyword coolwRepeat while loop pool
syn keyword coolwConditional if then else fi case of esac
syn keyword coolwClassDecl class inherits
syn keyword coolwStatement let in

syn keyword coolwBoolean true false
syn match coolwNumber '\<-\=\d\+\>'
syn region coolwString start='"' skip=/\v\\./ end='"' contains=coolwSpecialChar
syn match coolwSpecialChar "\\[btnfr\\"]" contained

syn keyword coolwOperator isvoid
syn match coolwOperator "=>\|\~=\|[<>][-=]\=\|=\|[+*\/~]"

syn match coolwId "[a-z][a-zA-Z0-9_]*"
syn keyword coolwType Object IO Int Str Bool SELF_TYPE
syn match coolwType "[A-Z][a-zA-Z0-9_]*"

syn match coolwComment "--#.*$" contains=coolwTodo
syn region coolwCommentBlock start='(\*' end='\*)' contains=coolwTodo,coolwCommentBlock
syn match coolwCommentBlockError "\*)"
syn keyword coolwTodo contained TODO FIXME XXX

hi def link coolwConditional Conditional
hi def link coolwRepeat Repeat
hi def link coolwClassDecl Statement
" honestly a bit ugly
" hi def link coolwClassDecl Structure
hi def link coolwStatement Statement

hi def link coolwBoolean Boolean
hi def link coolwNumber Number
hi def link coolwString String
hi def link coolwSpecialChar SpecialChar

hi def link coolwOperator Operator

" also a bit ugly
" hi def link coolwId Identifier
hi def link coolwType Type

hi def link coolwComment Comment
hi def link coolwCommentBlock coolwComment
hi def link coolwCommentBlockError Error
hi def link coolwTodo Todo

let b:current_syntax = "coolw"
